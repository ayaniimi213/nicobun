#!/bin/ruby
# ruby $HOME/nicobun/make_create_sql.rb > create_json.sql
# psql -p 5439 -h <Your-Redshift-IP -U <Your-Redshift-Username> nicodata -f create_json.sql
(0..1925).each{|i|
	puts "copy comment_data from '<Your-S3-bucket>/nicocomm/comment_data_json/" + sprintf("%04d", i) +"' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' json 'auto' MAXERROR 10000 ACCEPTINVCHARS GZIP;"
}
