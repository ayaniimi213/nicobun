--- sampling0000 dataset
create table videoinfo_sampling0000 (
       video_id varchar(10) not null distkey sortkey,
       thread_id integer,
       title varchar(65535),
       description varchar(65535),
       thumbnail_url varchar(65535),
       upload_time varchar(25),
       length integer,
       movie_type varchar(3),
       size_high integer,
       size_low integer,
       view_counter integer,
       comment_counter integer,
       mylist_counter integer,
       last_res_body varchar(65535));

create table tag_data_sampling0000 (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

create table comment_data_sampling0000 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);

copy videoinfo_sampling0000 from '<Your-S3-bucket>/videoinfo_tsv/0000video.tsv.gz' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy tag_data_sampling0000 from '<Your-S3-bucket>/tag_data_tsv/0000tags.tsv.gz' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy comment_data_sampling0000 from '<Your-S3-bucket>/nicocomm/comment_data_json/0000' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' json 'auto' MAXERROR 10000 ACCEPTINVCHARS GZIP;"
