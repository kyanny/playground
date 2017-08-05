#!/usr/bin/env ruby
require 'ostruct'

input = <<EOF
# 'on-order' リストへの
# 製品の追加
M AddProduct
F id          int
F name        char[30]
F order_code  int
E
EOF

data         = OpenStruct.new
data.comment = ""
data.module_name = nil
data.fields  = []
input.split("\n").each do |line|
  case line[0]
  when '#'
    data.comment << line
  when 'M'
    _, module_name = line.split(/\s+/)
    data.module_name = module_name
  when 'F'
    _, name, type = line.split(/\s+/)
    data.fields << {
        name: name,
        type: type,
    }
  when 'E'
    break
  else
    warn line
  end
end

def gen_ruby_class(data)
  puts <<EOF
class #{data.module_name}
#{
  data.fields.map { |field|
    'attr_accessor ' + ':' + field[:name] + '   # ' + field[:type]
  }.map{ |line| line.insert(0, "  ") }.join("\n")
}
end
EOF
end

gen_ruby_class(data)
