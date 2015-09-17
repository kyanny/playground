#!/usr/bin/env ruby
# Usage: ./get.rb uid
require 'dragonfly'
puts Dragonfly.app.fetch(ARGV[0]).data
