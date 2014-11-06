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

  grunt.registerTask 'compileDart', 'Compile Dart', (env) ->
    output = path.join((if env == 'tmp' then 'tmp' else 'dist'), 'dart')
    fs.removeSync output
    done = @async()
    grunt.util.spawn
      cmd: 'pub'
      args: ['build', '-o', baseOutput]
      opts:
        cwd: path.join(process.cwd(), 'assets', 'dart')
    , (err, res, code) ->
      if err?
        grunt.fail.warn(err.message)
      else
        fs.copySync path.join(baseOutput, 'web'), path.join(output)
      if env == 'tmp'
        request.get 'http://localhost:' + reloadPort + '/changed?files=main.dart.js', (err, res) ->
          done()
      else
        done()
