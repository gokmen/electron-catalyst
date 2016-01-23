module.exports = generateConfig = (options = {}) ->

  { os, arch, version, baseUrl, main } = (require './getdefaults') options

  os      ?= 'darwin'
  baseUrl ?= 'https://github.com/atom/electron/releases/download'

  config   =
    actions  : []

  file = "electron-v#{version}-#{os}-#{arch}"

  config.actions.push
    type        : 'get'
    source      : "#{baseUrl}/v#{version}/#{file}.zip"
    destination : "${CATALYST_DIR}/#{file}"

  frameworks = [ 'Electron Framework', 'Mantle', 'ReactiveCocoa', 'Squirrel']

  # copyFile, copyTree

  frameworks.forEach (framework) ->
    config.actions.push
      type        : 'copyTree'
      source      : "${CATALYST_DIR}/#{file}/Electron.app/Contents/Frameworks/#{framework}.framework"
      destination : "${BUNDLE_DIR}/Contents/Frameworks/#{framework}.framework"

  config.actions.push
    type        : 'copyFile'
    source      : "${CATALYST_DIR}/#{file}/Electron.app/Contents/MacOS/Electron"
    destination : "${BUNDLE_DIR}/Contents/MacOS/Electron"

  # TODO add ability to provide different entry points based on the platform
  config.command = "open"
  config.args    = [ "${BUNDLE_DIR}/Contents/MacOS/Electron" ]

  "#{JSON.stringify config, ' ', 2}\n"
