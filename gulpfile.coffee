gulp = require 'gulp'
webserver = require 'gulp-webserver'
del = require 'del'
filter = require 'gulp-filter'
bower = require 'main-bower-files'
sass = require 'gulp-sass'
styledocco = require 'gulp-styledocco'

gulp.task 'default', ['server'], ->

gulp.task 'bower', ->
  jsFilter = filter '**/*.js'
  cssFilter = filter '**/*.css'
  fontFilter = filter [
    '**/*.eot'
    '**/*.svg'
    '**/*.ttf'
    '**/*.woff'
    '**/*.woff2'
  ]
  gulp.src bower()
    .pipe jsFilter
    .pipe gulp.dest 'build/js/lib'
    .pipe jsFilter.restore()
    .pipe cssFilter
    .pipe gulp.dest 'build/css/lib'
    .pipe cssFilter.restore()
    .pipe fontFilter
    .pipe gulp.dest 'build/fonts/lib'

gulp.task 'sass', ->
  gulp.src 'src/css/**/*.scss'
    .pipe sass()
    .pipe gulp.dest('build/css')

gulp.task 'styledocco', ['clean:docs', 'bower', 'sass'], ->
  gulp.src ['build/**/*.css']
    .pipe styledocco
      out: 'docs'
      name: 'styledocco'

gulp.task 'clean', (cb) ->
  del ['build'], cb

gulp.task 'clean:docs', (cb) ->
  del ['docs'], cb

gulp.task 'build', ['clean'], ->
  gulp.src 'src/**/*'
    .pipe gulp.dest 'build'

gulp.task 'server', ['build'], ->
  gulp.src 'build'
    .pipe webserver
      livereload: true
      open: true
