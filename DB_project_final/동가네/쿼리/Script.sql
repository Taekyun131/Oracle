
create table aa (
no int(5) primary key auto_increment,
name varchar(10),
addr varchar(10)
);
drop table aa;

insert into aa (name,addr) values ('aa','수원');
insert into aa (name,addr) values('bb','인천');
insert into aa (name,addr) values('cc','제주');
select * from aa;

