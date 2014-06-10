var gulp = require('gulp'),
  concat = require('gulp-concat'),
  uglify = require('gulp-uglify'),
  watch = require('gulp-watch'),
  nodemon = require('gulp-nodemon'),
  coffee = require('gulp-coffee'),
  gutil = require('gulp-util'),
  coffeelint = require('gulp-coffeelint');

gulp.task('coffeelint', function() {
  gulp
    .src([
      './javascript/**/*.coffee',
      './test.coffee',
      './node/**/*.coffee',
      './node/main/**/*.coffee'])
    .pipe(coffeelint({
      'indentation': {
        'value': 2
      },
      'no_tabs': {
        'level': 'ignore'
      },
      'max_line_length': {
        'level': 'ignore'
      }
    }))
        .pipe(coffeelint.reporter())
});

gulp.task('compile-tracking', function() {
  gulp
    .src([
      'tracking/src/external.coffee',
      'tracking/src/core.coffee'
    ])
    .pipe(concat('compile.coffee'))
    .pipe(coffee({bare: false}).on('error', gutil.log))
    .pipe(concat('userlift.js'))
    .pipe(uglify())
    .pipe(gulp.dest('tracking/compiled'));
});

// Start Node server + watch files for changes
gulp.task('serve', ['coffeelint', 'compile-tracking'], function () {

  gulp.watch('tracking/src/**/*.coffee', ['compile-tracking']);

  nodemon({ script: 'node.js', ext: 'html js coffee', ignore: 'node_modules/*' })
    .on('change', ['coffeelint'])
    .on('restart', function (files) {
      
    });
});