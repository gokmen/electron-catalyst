
module.exports = generatePackage = (options = {}, callback) ->

  options  = require('./getdefaults') options
  packager = require 'electron-packager'
  packager options, callback
