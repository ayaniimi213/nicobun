#!/bin/env ruby

require 'json'
require 'zlib'
require 'nkf'
opt = "-w -h -Z1"

ARGV.each{|filename|
  video_dir = "."
  tag_dir = "."
  Zlib::GzipReader.open(filename) do |gz|
    video_file = Zlib::GzipWriter.open(video_dir + "/" + File.basename(filename, ".dat.gz") + "video.tsv.gz")
    tag_file = Zlib::GzipWriter.open(tag_dir + "/" + File.basename(filename, ".dat.gz") + "tags.tsv.gz")
    while line = gz.gets

      line = NKF.nkf(opt, line)
      line.gsub!(/\t/, "\\t")
      row = JSON.parse(line)

      video_file.puts [ row["video_id"], row["thread_id"], row["title"], row["description"], row["thumbnail_url"], row["upload_time"], row["length"], row["movie_type"], row["size_high"], row["size_low"], row["view_counter"], row["comment_counter"], row["mylist_counter"], row["last_res_body"] ].join("\t")

      row["tags"].each{|tag|
        tag_file.puts [ row["video_id"], tag["tag"], tag["category"], tag["lock"] ].join("\t")
      }
    end
  video_file.close
  tag_file.close
  end
}
