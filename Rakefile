require 'erb'

$tmpl = <<TMPL
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Playground</title>
  </head>
  <body>
    <h1><a href="https://github.com/kyanny/playground">https://github.com/kyanny/playground</a></h1>
    <ul>
      <% for dir in dirs -%>
      <li><a href="./<%= dir %>/"><%= dir %></a></li>
      <% end -%>
    </ul>
  </body>
</html>
TMPL

task :default do
  dirs = Dir["*"].select { |dir| File.directory?(dir) }
  html = ERB.new($tmpl, nil, "-").result(binding)
  File.write("index.html", html)
  puts "==> Write to index.html"
  puts ""
  puts html
end
