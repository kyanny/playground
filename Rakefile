require 'erb'

$tmpl = <<TMPL
# Playground

<% for dir in dirs -%>
- [<%= dir %>](/<%= dir %>/)
<% end -%>
TMPL

task :default do
  dirs = Dir["*"].select { |dir| File.directory?(dir) }
  markdown = ERB.new($tmpl, nil, "-").result(binding)
  File.write("README.md", markdown)
  puts "==> Write to README.md"
  puts ""
  puts markdown
end
