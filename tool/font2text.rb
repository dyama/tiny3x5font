#!/usr/bin/ruby
# coding: utf-8

$font = File.open("../font/3x5.font").readlines.select{|n|n =~ /^[-\*]{3}$/}.map{|n|n.strip!;n.split(//)}

def textline(text)
  scr = [[], [], [], [], []]
  text.split(//).each do |ch|
    c = ch.ord - " ".ord
    $font[c*5, 5].each_with_index do |a, i|
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
  n = 0
  (' '..'~').each do |c|
    if n != 0 && n % 16 == 0
      s += "\n"
    end
    s += c
    n += 1
  end
end

s = ""

STDIN.read.each_line do |t|
  s += t
end
hoge s

