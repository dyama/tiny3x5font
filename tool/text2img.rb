#!/usr/bin/ruby
# coding: utf-8

# Convert text based font string to GIF image file
# with ImageMagick

cmd = "convert"
arg = "-size 256x128 xc:white"

y=0
STDIN.read.each_line do |ln|
  x=0
  ln.each_char do |c|
    if c == "*"
      arg += " -draw 'point #{x},#{y}'"
    end
    x += 1
  end
  y += 1
end

# arg += " -scale 200%"

`#{cmd} #{arg} out.png`

