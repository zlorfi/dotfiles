#!/usr/bin/env ruby

require 'optparse'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: rnd2 COMMANDS [OPTIONS]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     generate: generate a random string containing alphanumeric chars"
  opt.separator  ""
  opt.separator  "Options"

  opt.on("-l","--length LENGTH","how long should the generated string be") do |length|
    options[:length] = length
  end

  opt.on("-c","--count COUNT","how many times should the string be generated") do |count|
    options[:count] = count
  end

  opt.on("-h","--help","help") do
    puts opt_parser
  end

end

opt_parser.parse!

length = options[:length] || 8
count = options[:count] || 1

def generate_code(number)
  charset = Array('A'..'Z') + Array('a'..'z') + Array(0 .. 9)
  Array.new(number) { charset.sample }.join
end

case ARGV[0]
when "generate"
  count.to_i.times{ puts generate_code length.to_i }
else
  puts opt_parser
end
