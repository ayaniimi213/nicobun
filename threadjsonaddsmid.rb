#!/bin/env ruby

require 'json'
require 'zlib'

thread_dir = "."

ARGV.each{|filename|
  File.open(filename) do |dat|
    video_id = File.basename(filename, ".dat")

    thread_file = Zlib::GzipWriter.open(thread_dir + "/" + File.basename(filename, ".dat") + "thread.json.gz")
    while line = dat.gets
      
      row = JSON.parse(line)

     comment = row["comment"]
	comment = "" if comment.nil?
      comment.gsub!(/\\/){ '\\\\' }  
      comment.gsub!(/\t/, "\\t")
      comment.gsub!(/\n/, "\\n")
      comment.gsub!(/"/, "\\\"")
      command = row["command"]
	command = "" if command.nil?
      command.gsub!(/\\/){ '\\\\' }  
      command.gsub!(/\t/, "\\t")
      command.gsub!(/\n/, "\\n")
      command.gsub!(/"/, "\\\"")

      thread_file.puts "{" + [ '"vpos":' + row["vpos"].to_s, '"no":' + row["no"].to_s, '"command":"' + command + '"', '"video_id":' + '"' + video_id + '"', '"comment":"' + comment + '"', '"date":' + row["date"].to_s ].join(",") + "}"

    end
    thread_file.close
  end
}
