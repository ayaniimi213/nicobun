-- vidoeinfoのデータ件数
select trim(name) tablename, col, to_char(sum(num_values), '999,999,999,999') count 
  from SVV_DISKUSAGE 
 where name = 'vidoeinfo'
 group by name, col
 order by 1, 2;

-- vidoeinfoのデータ件数
select trim(name) tablename, col, to_char(sum(num_values), '999,999,999,999') count 
  from SVV_DISKUSAGE 
 where name = 'tag_data'
 group by name, col
 order by 1, 2;

-- tagの上位100件
select "tag", count(*) as count from tag_data group by "tag" order by count DESC limit 100;

