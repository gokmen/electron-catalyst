module.exports = generateConfig = (options = {}) ->

  { os, arch, version, baseUrl, main } = options

  os      ?= 'darwin'
  arch    ?= 'x64'
  version ?= '0.36.5'
  baseUrl ?= 'https://github.com/atom/electron/releases/download'
  main    ?= 'Resources/app'

  config       =
    files      : []
    entryPoint : ''

  file = "electron-v#{version}-#{os}-#{arch}"

  config.files.push
    source      : "#{baseUrl}/v#{version}/#{file}.zip"
    destination : "#{file}"

  # TODO add ability to provide different entry points based on the platform
  config.entryPoint = [
    "#{file}/Electron.app/Contents/MacOS/Electron", main
  ]

  JSON.stringify config, ' ', 2
