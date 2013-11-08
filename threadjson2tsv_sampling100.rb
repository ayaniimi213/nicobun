#!/usr/bin/env ruby

require 'json'
require 'zlib'
require 'nkf'
opt = "-w"

thread_dir = "."

ARGV.each{|filename|
  File.open(filename) do |dat|
    thread_file = Zlib::GzipWriter.open(thread_dir + "/" + File.basename(filename, ".dat") + "thread.tsv.gz")
    video_id = File.basename(filename, ".dat")
    next unless /00$/ === row["video_id"]
    while line = dat.gets
      
      line = NKF.nkf(opt, line)
      row = JSON.parse(line)
      comment = row["comment"]
      comment.gsub!(/\t/, "\\t")
      comment.gsub!(/\n/, "\\n")
      
      thread_file.puts [ video_id, row["date"], row["no"], row["vpos"], comment, row["command"] ].join("\t")
      
    end
    thread_file.close
  end
}
