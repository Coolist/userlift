var gulp = require('gulp'),
  concat = require('gulp-concat'),
  uglify = require('gulp-uglify'),
  watch = require('gulp-watch'),
  nodemon = require('gulp-nodemon'),
  coffee = require('gulp-coffee'),
  gutil = require('gulp-util'),
  coffeelint = require('gulp-coffeelint'),
  mocha = require('gulp-mocha');

require('coffee-script/register');

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
      'no_backticks': {
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
      'tracking/src/browsers.coffee',
      'tracking/src/plugins.coffee',
      'tracking/src/external.coffee',
      'tracking/src/init.coffee',
      'tracking/src/core.coffee'
    ])
    .pipe(concat('compile.coffee'))
    .pipe(coffee({bare: false}).on('error', gutil.log))
    .pipe(concat('userlift.js'))
    .pipe(uglify())
    .pipe(gulp.dest('tracking/compiled'));
});

gulp.task('compile-experiment', function() {
  gulp
    .src([
      'node/main/experimentSnippet/template/src/plugins.coffee',
      'node/main/experimentSnippet/template/src/main.coffee'
    ])
    .pipe(concat('compile.coffee'))
    .pipe(coffee({bare: false}).on('error', gutil.log))
    .pipe(concat('template.js'))
    .pipe(uglify())
    .pipe(gulp.dest('node/main/experimentSnippet/template/compiled'));
});

gulp.task('test', function () {
  gulp.src('./test/**/*.coffee')
    .pipe(mocha({reporter: 'spec'}));
});

// Start Node server + watch files for changes
gulp.task('serve', ['coffeelint', 'compile-tracking', 'compile-experiment'], function () {

  gulp.watch('tracking/src/**/*.coffee', ['compile-tracking']);
  gulp.watch('node/main/experimentSnippet/template/src/**/*.coffee', ['compile-experiment']);

  nodemon({ script: 'node.js', ext: 'html js coffee', ignore: ['node_modules/*', 'angular/*'] })
    .on('change', ['coffeelint'])
    .on('restart', function (files) {
      
    });
});