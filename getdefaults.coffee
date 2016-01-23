os = require 'os'

module.exports = getDefaults = (input) ->

  input.dir      ?= '.'
  input.arch     ?= 'x64'
  input.version  ?= '0.36.5'
  input.platform ?= os.platform()

  input
