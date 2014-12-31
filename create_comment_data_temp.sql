create table comment_data00 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data01 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data02 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data03 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data04 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data05 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data06 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data07 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data08 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data09 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data10 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data11 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data12 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data13 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data14 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data15 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data16 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data17 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data18 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);
create table comment_data19 (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);

create table comment_data_dummy (
       date integer,
       no integer,
       vpos integer,
       comment varchar(65535),
       command varchar(65535),
       video_id varchar(10) not null distkey sortkey);

drop table comment_data;
ALTER TABLE comment_data_dummy RENAME TO comment_data;
