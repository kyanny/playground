#!/usr/bin/env ruby
require 'pp'
require 'fileutils'

file = 'addressbook.db'
KEYS = %w[ name phone ]

unless File.exist?(file)
  FileUtils.touch(file)
end

db = []
begin
  db = Marshal.load(File.binread(file))
rescue ArgumentError
end

if ARGV.length > 0
  # Write mode
  input = {}
  ARGV.each do |data|
    key, val = data.split(/\s*=\s*/)
    raise "Unknown field #{key}" unless KEYS.include?(key)
    input[key] = val
  end
  target = db.find { |record|
    input.any? { |key, val|
      record[key] == val
    }
  }
  index = db.index(target)
  if target
  # Update mode
    input.each do |key, val|
      target[key] = val
    end
    db[index] = target
  else
    # Add mode
    db << input
  end
  File.binwrite(file, Marshal.dump(db))
else
  pp db
end
