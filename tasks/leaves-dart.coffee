path    = require 'path'
fs      = require 'fs-extra'
_       = require 'lodash'
request = require 'request'

module.exports = (grunt) ->

  baseOutput = path.join process.cwd(), '.build'
  reloadPort = null

  grunt.event.on 'loaded', ->
    reloadPort = grunt.config.get('watch.livereload.options.livereload.port')

    _.each ['watch.assets.files', 'watch.assetsGlob.files'], (key) ->
      watched = grunt.config.get(key)
      watched.push('!assets/**/*.dart')
      grunt.config.set(key, watched)

    grunt.config.set 'watch.dart',
      files: ['assets/dart/**/*']
      tasks: ['brerror:compileDart:tmp']

    grunt.event.on 'coffee.run', (env) ->
      grunt.task.run "compileDart:#{env}"

    tmpAssetsSrc = grunt.config('copy.tmpAssets.src')
    tmpAssetsSrc.push('!dart/**/*')
    grunt.config.set('copy.tmpAssets.src', tmpAssetsSrc)

  grunt.registerTask 'compileDart', 'Compile Dart', (env) ->

    unless env == 'tmp'
      grunt.log.writeln 'Production mode not supported yet. Aborting'
      return

    fs.copySync path.join('assets', 'dart', 'web'), path.join('tmp', 'dart')
    fs.remove path.join('tmp', 'dart', 'packages')
    fs.copySync path.join('assets', 'dart', 'packages'), path.join('tmp', 'dart', 'packages')
