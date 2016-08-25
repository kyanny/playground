gulp = require "gulp"
connect = require "connect"
serveStatic = require "serve-static"
livereload = require "gulp-livereload"
connectLivereload = require "connect-livereload"

gulp.task "default", ->
  livereload.listen()
  connect()
    .use connectLivereload()
    .use serveStatic './'
    .listen 9000
