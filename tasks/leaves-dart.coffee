path    = require 'path'
fs      = require 'fs-extra'
_       = require 'lodash'
request = require 'request'

module.exports = (grunt) ->

  baseOutput = path.join process.cwd(), '.build'
  reloadPort = null

  grunt.event.on 'loaded', ->
    reloadPort = grunt.config.get('watch.livereload.options.livereload.port')

    grunt.event.on 'makeCopy.run', (env) ->
      grunt.task.run "compileDart:#{env}"

    grunt.config.set 'watch.dart',
      files: ['dart/**/*']
      tasks: ['compileDart:tmp']

    grunt.config.set 'copy.dart'
      expand: true
      cwd: 'dart'
      src: ['**/*']
      dest: 'tmp'

  grunt.registerTask 'compileDart', 'Compile Dart', (env) ->
    unless env == 'tmp'
      grunt.log.writeln 'Production mode not supported yet. Aborting'
      return
    grunt.task.run 'copy:dart'
