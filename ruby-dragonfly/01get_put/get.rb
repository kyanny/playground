#!/usr/bin/env ruby
require 'dragonfly'
puts Dragonfly.app.fetch(ARGV[0]).data
