create table videoinfo_uniq (
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

insert into videoinfo_distinct(video_id, thread_id, title, description, thumbnail_url, upload_time, length, movie_type, size_high, size_low, view_counter, comment_counter, mylist_counter, last_res_body) select DISTINCT * from videoinfo;

ALTER TABLE videoinfo_distinct RENAME TO videoinfo_uniq;

create table tag_data_uniq (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

insert into tag_data_uniq(video_id, "tag", category, lock) select DISTINCT * from tag_data;

--- sampling100 dataset
create table videoinfo_sampling100_uniq (
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

create table tag_data_sampling100_uniq (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

insert into videoinfo_sampling100_uniq(video_id, thread_id, title, description, thumbnail_url, upload_time, length, movie_type, size_high, size_low, view_counter, comment_counter, mylist_counter, last_res_body) select * from videoinfo_uniq where video_id like '%00';

insert into tag_data_sampling100_uniq(video_id, "tag", category, lock) select * from tag_data_uniq where video_id like '%00';

--- sampling10 dataset
create table videoinfo_sampling10_uniq (
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

create table tag_data_sampling10_uniq (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

insert into videoinfo_sampling10_uniq(video_id, thread_id, title, description, thumbnail_url, upload_time, length, movie_type, size_high, size_low, view_counter, comment_counter, mylist_counter, last_res_body) select * from videoinfo_uniq where video_id like '%0';

insert into tag_data_sampling10_uniq(video_id, "tag", category, lock) select * from tag_data_uniq where video_id like '%0';

drop table videoinfo;
ALTER TABLE videoinfo_uniq RENAME TO videoinfo;
drop table videoinfo_sampling10;
ALTER TABLE videoinfo_sampling10_uniq RENAME TO videoinfo_sampling10;
drop table videoinfo_sampling100;
ALTER TABLE videoinfo_sampling100_uniq RENAME TO videoinfo_sampling100;

drop table tag_data;
ALTER TABLE tag_data_uniq RENAME TO tag_data;
drop table tag_data_sampling10;
ALTER TABLE tag_data_sampling10_uniq RENAME TO tag_data_sampling10;
drop table tag_data_sampling100;
ALTER TABLE tag_data_sampling100_uniq RENAME TO tag_data_sampling100;
