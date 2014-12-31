--- sampling100 dataset
create table videoinfo_sampling10 (
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

create table tag_data_sampling10 (
       video_id varchar(10) not null distkey sortkey,
       "tag" varchar(65535),
       category integer,
       lock integer);

create table comment_data_sampling10 (
       video_id varchar(10) not null distkey sortkey,
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535));


insert into videoinfo_sampling10(video_id, thread_id, title, description, thumbnail_url, upload_time, length, movie_type, size_high, size_low, view_counter, comment_counter, mylist_counter, last_res_body) select * from videoinfo where video_id like '%0';

insert into tag_data_sampling10(video_id, "tag", category, lock) select * from tag_data where video_id like '%0';

insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data00 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data01 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data02 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data03 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data04 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data05 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data06 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data07 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data08 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data09 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data10 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data11 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data12 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data13 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data14 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data15 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data16 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data17 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data18 where video_id like '%0';
insert into comment_data_sampling10(date, no, vpos, comment, command, video_id) select * from comment_data19 where video_id like '%0';
