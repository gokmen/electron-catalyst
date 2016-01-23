module.exports = generateConfig = (options = {}) ->

  { os, arch, version, baseUrl, main } = (require './getdefaults') options

  os      ?= 'darwin'
  baseUrl ?= 'https://github.com/atom/electron/releases/download'
  main    ?= '{$CWD}/Resources/app'

  config   =
    files  : []

  file = "electron-v#{version}-#{os}-#{arch}"

  config.files.push
    source      : "#{baseUrl}/v#{version}/#{file}.zip"
    destination : "#{file}"

  # TODO add ability to provide different entry points based on the platform
  config.command = 'open'
  config.args = [
    "{$CATALYST_DIR}/#{file}/Electron.app/Contents/MacOS/Electron", main
  ]

  "#{JSON.stringify config, ' ', 2}\n"
