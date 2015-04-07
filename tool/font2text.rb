#!/usr/bin/ruby
# coding: utf-8

$w=3
$h=5

$w=5
$h=7

$font = File.open("../font/#{$w}x#{$h}.font").readlines.select{|n|n =~ /^[-\*]{3,}$/}.map{|n|n.strip!;n.split(//)}

def textline(text)
  scr = []
  (1..$h).each do |x|
    scr.push [] 
  end
  text.split(//).each do |ch|
    c = ch.ord - " ".ord
    $font[c*$h, $h].each_with_index do |a, i|
      a.each do |b|
        scr[i].push b
      end
    end
    scr.each do |ary|
      ary.push "-"
    end
  end
  scr
end

def hoge(text)
  text.each_line do |line|
    line.chomp!
    textline(line).each do |n|
      n.each do |m|
        if m != "*"
          print " "
        else
          print m
        end
      end
      puts ""
    end
    puts " "
  end
end

def ascii
  s = ""
  n = 0
  (' '..'~').each do |c|
    if n != 0 && n % 16 == 0
      s += "\n"
    end
    s += c
    n += 1
  end
  return s
end

s = ""

if ARGV.size > 0
  s += ascii
else
  STDIN.read.each_line do |t|
    s += t
  end
end

hoge s

