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

create table comment_data (
       video_id varchar(10) not null distkey sortkey,
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535));

copy videoinfo from '<Your-S3-bucket>/videoinfo_tsv' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy tag_data from '<Your-S3-bucket>/tag_data_tsv' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy comment_data from '<Your-S3-bucket>/comment_data_tsv' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

--- sampling100 dataset
create table videoinfo_sampling100 (
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

create table tag_data_sampling100 (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

create table comment_data_sampling100 (
       video_id varchar(10) not null distkey sortkey,
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535));

copy videoinfo from '<Your-S3-bucket>/videoinfo_tsv_sampling100' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy tag_data from '<Your-S3-bucket>/tag_data_tsv_sampling100' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy comment_data from '<Your-S3-bucket>/comment_data_tsv_sampling100' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

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

copy videoinfo from '<Your-S3-bucket>/videoinfo_tsv/0000video.tsv.gz' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;

copy tag_data from '<Your-S3-bucket>/tag_data_tsv/0000tags.tsv.gz' CREDENTIALS 'aws_access_key_id=<Your-Access-Key-ID>;aws_secret_access_key=<Your-Secret-Access-Key>' delimiter '\t' GZIP;
