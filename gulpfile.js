var gulp = require('gulp'),
	concat = require('gulp-concat'),
	uglify = require('gulp-uglify'),
	minifyCSS = require('gulp-minify-css'),
	sass = require('gulp-sass'),
	watch = require('gulp-watch'),
	nodemon = require('gulp-nodemon'),
	jshint = require('gulp-jshint'),
	jshintStylish = require('jshint-stylish'),
	cssPrefixer = require('gulp-autoprefixer'),
	coffee = require('gulp-coffee'),
	gutil = require('gulp-util'),
	gulpif = require('gulp-if'),
	coffeelint = require('gulp-coffeelint'),
	jsFiles;

// Javascript files to concatenate (in order)
jsFiles = [
	'javascript/**/*.js',
	'javascript/**/*.coffee'
];

// SASS
gulp.task('sass', function () {
	gulp
		.src('stylesheets/*.scss')
		.pipe(sass({
			errLogToConsole: true
		}))
		.pipe(cssPrefixer("last 2 versions", "> 1%", "ie 9"))
		.pipe(gulp.dest('static/css/'));
});

// Concat JS/Cofeee files
gulp.task('concatjs', function () {
	gulp
		.src(jsFiles)
		.pipe(gulpif(/[.]coffee$/, coffee({bare: true}))).on('error', gutil.log)
		.pipe(concat('main.js'))
		.pipe(gulp.dest('static/js/'));
});

// Concat + minify JS files
gulp.task('uglify', function () {
	gulp
		.src(jsFiles)
		.pipe(gulpif(/[.]coffee$/, coffee({bare: true}))).on('error', gutil.log)
		.pipe(concat('main.js'))
		.pipe(uglify())
		.pipe(gulp.dest('static/js/'));
});

// jsHint
gulp.task('lint', function () {
	gulp
		.src([
			'./javascript/**/*.js',
			'./node.js',
			'./node/**/*.js',
			'./node/main/**/*.js'])
		.pipe(jshint({
			'undef': true,
			'unused': true,
			'camelcase': true,
			'eqeqeq': true,
			'indent': 4,
			'curly': true,
			'quotmark': 'single',
			'browser': true,
			'node': true
		}))
		.pipe(jshint.reporter(jshintStylish))
})

gulp.task('coffeelint', function() {
	gulp
		.src([
			'./javascript/**/*.coffee',
			'./test.coffee',
			'./node/**/*.coffee',
			'./node/main/**/*.coffee'])
		.pipe(coffeelint({
			'indentation': {
				'value': 1
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
gulp.task('serve', ['sass', 'concatjs', 'lint', 'coffeelint', 'compile-tracking'], function () {

	gulp.watch('stylesheets/**/*.scss', ['sass']);
	gulp.watch('javascript/**/*.js', ['concatjs']);
	gulp.watch('tracking/src/**/*.coffee', ['compile-tracking']);

	nodemon({ script: 'node.js', ext: 'html js coffee', ignore: 'node_modules/*' })
		.on('change', ['lint', 'coffeelint'])
		.on('restart', function (files) {
			
		});
});