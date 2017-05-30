// including gulp
var gulp = require('gulp');
domSrc = require('gulp-dom-src'),
  concat = require('gulp-concat'),
  concatCss = require('gulp-concat-css'),
  cssmin = require('gulp-cssmin'),
  uglify = require('gulp-uglify'),
  htmlreplace = require('gulp-html-replace'),
  gutil = require('gulp-util');

// environment variables
var devJsSourceDir = 'source/**/*.js',
  distributionDevJs = 'distribution-dev.js',
  distributionStyle = 'distribution-style.css',
  distributionDir = 'distribution'

// folder copy task
gulp.task('asset-folder-copy', function () {
  return gulp.src('source/assets/**/*')
    .pipe(gulp.dest(distributionDir + '/assets'));
});

// html file copy tasks
gulp.task('dev-views-html-copy', function () {
  return gulp.src('source/views/**/*.html')
    .pipe(gulp.dest(distributionDir + '/views'));
});

gulp.task('dev-directives-html-copy', function () {
  return gulp.src('source/directives/view/**/*.html')
    .pipe(gulp.dest(distributionDir + '/directives/view'));
});

// css concat task
gulp.task('distribution-css', function () {
  return domSrc({
      file: 'source/index.html',
      selector: 'link',
      attribute: 'href'
    })
    .pipe(concatCss(distributionStyle))
    // .pipe(cssmin())
    .pipe(gulp.dest(distributionDir));
});

// dev js concat task
gulp.task('distribution-dev-js', function () {
  return gulp.src(devJsSourceDir)
    .pipe(concat(distributionDevJs))
    // .pipe(uglify())
    .pipe(gulp.dest(distributionDir));
});

// html replace task
gulp.task('html-replace', function () {
  return gulp.src('source/index.html')
    .pipe(htmlreplace({
      'distribution-logic-js': distributionDevJs,
      'distribution-style-css': distributionStyle
    }, {
      keepBlockTags: true
    }))
    .pipe(gulp.dest(distributionDir));
});

// task tree
gulp.task('default', gulp.series(
  'asset-folder-copy',
  'dev-views-html-copy',
  'dev-directives-html-copy',
  'distribution-css',
  'distribution-dev-js',
  'html-replace'
));