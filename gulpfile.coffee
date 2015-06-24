gulp = require 'gulp'
webserver = require 'gulp-webserver'

gulp.task 'default', ->
  console.log 'hello.'

gulp.task 'server', ->
  gulp.src 'src'
    .pipe webserver
      livereload: true
      open: true
