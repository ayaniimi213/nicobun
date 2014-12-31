--- original dataset
create table videoinfo (
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

create table tag_data (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

copy videoinfo from '<Your-S3-bucket>/videoinfo_tsv' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy tag_data from '<Your-S3-bucket>/tag_data_tsv' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

