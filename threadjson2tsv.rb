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
    while line = dat.gets
      
      line = NKF.nkf(opt, line)
      line.gsub!(/\t/, "\\t")
      row = JSON.parse(line)

      thread_file.puts [ video_id, row["date"], row["no"], row["vpos"], row["comment"], row["command"] ].join("\t")
      
    end
    thread_file.close
  end
}
