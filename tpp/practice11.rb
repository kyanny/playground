#!/usr/bin/env ruby

symbols = STDIN.readlines.map(&:chomp).map(&:strip)

File.write('name.h', <<EOF)
extern const char* NAME_names[];
typedef enum {
#{symbols.join(",\n")}
} NAME;
EOF

File.write('name.c', <<EOF)
const char* NAME_names[] = {
#{symbols.map{|sym| %Q!"#{sym}"! }.join(",\n")}
};
EOF
