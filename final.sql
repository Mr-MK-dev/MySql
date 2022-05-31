drop database if exists monster;
create database monster;
use monster;

create table users(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name CHAR(230),
    delme INT,
    UNIQUE(id,name)
);

CREATE TABLE POSTS(
    id  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userpost VARCHAR(30),
    userid INT 
);
-- Alter Query
alter table users
                  MODIFY column name VARCHAR(230)  NOT NULL DEFAULT 'newUser',
                  drop delme;
alter table posts 
                  add FOREIGN key(userid) REFERENCES users(id);

alter table users
                 alter COLUMN name DROP DEFAULT ;
ALTER table posts 
                 add CONSTRAINT myCheck CHECK(userid < 20);

Alter table users 
                  ADD CONSTRAINT myUniqueConstraint UNIQUE(id,name);
--  It is avalible to use with P_KEY or F_KEY
-- add  CONSTRAINT myP_key PRIMARY KEY(id,name)
-- add  CONSTRAINT myF_key FOREIGN key(id,name)
-- CONSTRAINT NOT NULL - DEFULT   UNIQUE   
Alter table users 
                   DROP CONSTRAINT myUniqueConstraint;
-- YOU can also replace the  {INDEX} by {CONSTRAINT}
                
create index postindex
                 on  posts(userpost);
alter table posts
                 drop index postindex;
-- ALTER DONE 

insert into users values (null,'mk');
insert into users values (null,'MNM');
insert into users(id) values (null);


insert into posts values (null,'mk java post',1);
insert into posts values (null,'mk java post',1);
insert into posts values (null,'mk Linux post',1);
insert into posts values (null,'MNM JS post',2);
insert into posts values (null,'MNM CSS post',2);
-- insert into posts values (null,'Post to ruin',20);
insert into posts values (null,'deleted post',2);

update posts set userpost = 'new mk NodeJS post'  where userpost like "%java%";
delete from posts where userpost like '___eted%';


select * from users limit 1;
select * from posts;

SELECT DISTINCT u.name AS 'USERNAME' ,  p.userpost AS 'Posts'
from users u right join posts p
on u.id = p.userid
GROUP by posts
having posts like '%mk%'
order by name 
DESC;

 create view mk_view as   --  virtual table 1- No extra memory 
-- CReATE table mk_table as 
SELECT
name , userpost 
from users,posts
where users.id = posts.userid;

-- to update & mod & del
UPDATE  mk_view set name ="ROAA" where name = 'MNM';
-- DELETE from mk_view where name = 'ROAA'; -- Won't del because it joined
 SELECT * from mk_view;
 drop view mk_view;
-- MK        THANKS FOR THIS WORK mk        -- MK
             --      DONE
