#!/usr/bin/env ruby
require 'rubygems'
require 'HOTP'

def usage
  puts "Usage: hotpcalc.rb <secret> <code1> <code2>"
end

secret = ARGV.shift
code1 = ARGV.shift
code2 = ARGV.shift

if secret.nil? or code1.nil? or code2.nil?
  usage
  exit(1)
end

h = HOTP.new()
h.secret = secret.to_a.pack('H*') # 20 byte key
h.digits=6                        # How many digits to return (length of the HOTP value)

i = 0
while i < (2<<63)
  h.count = i
  result = h.update
  if result == code1
    i += 1
    h.count = i
    nextresult = h.update
    if nextresult == code2
      puts "Sequence: #{i}"
      exit(0)
    else
      puts "First code #{result} matched, second code #{nextresult} didn't."
    end
  end
  i += 1
end
