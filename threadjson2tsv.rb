#!/usr/bin/env ruby

require 'json'
require 'zlib'

thread_dir = "."

ARGV.each{|filename|
  File.open(filename) do |dat|
    video_id = File.basename(filename, ".dat")

    thread_file = Zlib::GzipWriter.open(thread_dir + "/" + File.basename(filename, ".dat") + "thread.tsv.gz")
    while line = dat.gets
      
      line.chomp!
      row = JSON.parse(line)
      comment = row["comment"]
      comment.gsub!(/\t/, "\\t")
      comment.gsub!(/\n/, "\\n")
      command = row["command"]
      command.gsub!(/\t/, "\\t")
      command.gsub!(/\n/, "\\n")

      thread_file.puts [ row["date"], row["no"], row["vpos"], comment, command, video_id ].join("\t")
      
    end
    thread_file.close
  end
}
