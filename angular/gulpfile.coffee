# Gulp
gulp = require 'gulp'
rimraf = require 'rimraf'
gutil = require 'gutil'
coffeelint = require 'gulp-coffeelint'

# Webpack
webpack = require 'webpack'
webpackNgmin = require 'ngmin-webpack-plugin'
webpackConfig = require './webpack.config'

# Configuration
src = [
  'src/**/*.*'
  '!src/**/*.coffee',
  '!src/**/*.scss'
]

dest = './compile/'

# Coffeelint
gulp.task 'coffeelint', () ->
  gulp
    .src([
      'src/**/*.coffee'
    ])
    .pipe(coffeelint(
      indentation:
        value: 2
      no_tabs:
        level: 'ignore'
      no_backticks:
        level: 'ignore'
      max_line_length:
        level: 'ignore'
    ))
    .pipe coffeelint.reporter()

# Webpack task
gulp.task 'webpack', () ->
  webpackConfig.plugins = webpackConfig.plugins.concat new webpackNgmin(), new webpack.optimize.UglifyJsPlugin()
  webpackConfig.devtool = false

  webpack webpackConfig, (err, stats) ->
    if (err)
      throw err
    gutil.log '[webpack]', stats.toString()

gulp.task 'empty', () ->
  rimraf.sync dest, gutil.log

gulp.task 'other', ->
  gulp.src src
  .pipe gulp.dest dest

gulp.task 'build', [ 'coffeelint', 'empty', 'webpack', 'other' ]

gulp.task 'watch', ['coffeelint', 'empty', 'other'], () ->
  gulp.watch src, ['other']
  gulp.watch ['src/**/*.coffee'], ['coffeelint']
  webpack webpackConfig
  .watch 200, (err, stats) ->
    if (err)
      throw err
    gutil.log '[webpack]', stats.toString()