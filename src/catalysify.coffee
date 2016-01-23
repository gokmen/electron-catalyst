fs   = require 'fs-extra'
glob = require 'glob-all'
exit = require './exit'

module.exports = catalysify = (dir, appName, argv = {}) ->

  exit.fail 'App dir should be ended with .app'  unless /\.app$/.test dir

  console.log dist = "#{dir[..-5]}-catalyst.app"

  fs.removeSync dist  if argv.overwrite

  try
    fs.copySync dir, dist
  catch err
    if err.code is 'EEXIST'
      exit.fail 'output dir already exists, use --overwrite to force'
    exit.fail 'Failed to create copy of the generated app:', err

  console.log 'Bundled version copied, cleaning up...'

  frameworks = glob.sync "#{dist}/Contents/Frameworks/*.framework"

  frameworks.forEach (framework) ->
    console.log "> removing", framework
    fs.removeSync framework

