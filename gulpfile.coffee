# Load all required libraries.
gulp = require 'gulp'

# load all plugins from package.json dependencies
plugins = require('gulp-load-plugins')();

# load all tasks from modules and task directory
require('gulp-load')(gulp)
gulp.loadTasks __dirname

#gutil = require 'gulp-util'
#coffee = require 'gulp-coffee'
#istanbul = require 'gulp-istanbul'
#mocha = require 'gulp-mocha'
#coveralls = require 'gulp-coveralls'

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe plugins.coffee({bare: true}).on('error', plugins.util.log)
    .pipe gulp.dest './lib/'

gulp.task 'test', ['coffee'], ->
  gulp.src ['lib/**/*.js']
    .pipe(plugins.istanbul()) # Covering files
    .on 'finish', ->
      gulp.src(['test/**/*.spec.coffee'])
        .pipe plugins.mocha reporter: 'spec', compilers: 'coffee:coffee-script/register'
        .pipe plugins.istanbul.writeReports({
          dir: './coverage'
          reporters: [ 'html', 'lcov', 'json', 'text', 'text-summary' ]
          reportOpts: { dir: './coverage' }
          # coverageVariable: 'someVariable'
        }) # Creating the reports after tests run

gulp.task 'coverall', ->
  gulp.src 'coverage/**/lcov.info'
    .pipe(plugins.coveralls())

gulp.task 'default', ['test', 'coffee']
