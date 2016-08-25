var gulp = require('gulp');
var babel = require('gulp-babel');
var browserSync = require('browser-sync').create();

gulp.task('browser-sync', function() {
  browserSync.init({
    server: {
      baseDir: "./"
    },
    files: ['**/*']
  });
});

gulp.task('babel', function() {
  return gulp.src(['src/*.js'])
    .pipe(babel())
    .pipe(gulp.dest('dist'));
});

gulp.task('default', ['browser-sync', 'babel'])
