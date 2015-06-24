gulp = require 'gulp'
webserver = require 'gulp-webserver'
del = require 'del'

gulp.task 'default', ['server'], ->

gulp.task 'clean', (cb) ->
  del ['build'], cb

gulp.task 'build', ['clean'], ->
  gulp.src 'src/**/*'
    .pipe gulp.dest 'build'

gulp.task 'server', ['build'], ->
  gulp.src 'build'
    .pipe webserver
      livereload: true
      open: true
