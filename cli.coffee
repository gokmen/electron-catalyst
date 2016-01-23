#!/usr/bin/env coffee

fs         = require 'fs-extra'
argv       = require('yargs').argv
exit       = require './src/exit'
catalysify = require './src/catalysify'

usage = fs.readFileSync("#{__dirname}/usage.txt").toString()

[ sourceDir, appName ] = argv._

if argv.help
  exit.success usage

if not sourceDir or not appName
  exit.fail usage

if argv.generateConfig

  generateConfig = require './src/generateconfig'
  exit.success generateConfig argv

else if argv.catalystOnly

  console.log 'Creating catalyst version...'
  catalysify sourceDir, appName, argv

else

  generatePackage = require './src/generatepackage'

  argv.name = appName
  argv.dir  = sourceDir

  generatePackage argv, (err, appPath = []) ->

    if err
      if err.message?
      then exit.fail err.message
      else exit.fail err, err.stack

    else if appPath.length > 0

      console.log 'Electron package created in:', appPath[0]
      exit.success 'Skipping catalyst version'  if argv.skipCatalyst

      argv = (require './src/getdefaults') argv
      base = "#{argv.dir}/#{appName}-#{argv.platform}-#{argv.arch}/#{appName}.app"

      catalysify base, appName, argv
