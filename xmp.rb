#!/usr/bin/env ruby
# encoding: utf-8

require 'exifr'
require 'exifr/jpeg'
require 'open-uri'
require 'xmp'
require 'byebug'

dir = "/Users/dshorthouse/Downloads/archive"

Dir.foreach(dir) do |item|
  next if item == '.' or item == '..'
  img = EXIFR::JPEG.new(File.join(dir,item))
  xmp = XMP.parse(img)

  if xmp.xmp.cmncollectionno
    puts item
  end rescue nil

  #puts xmp.xmp.cmncollectionno rescue puts "--failed: #{item}"
end
