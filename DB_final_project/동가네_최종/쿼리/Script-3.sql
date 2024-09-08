CREATE TABLE ask(
s_id varchar(20),
id varchar(20),
i_name varchar(20),
moon_content varchar(20),
SECRET VARCHAR(1) CHECK(SECRET IN('Y','N'))
);

drop table ASK;
insert into ask (s_id,id,i_name,moon_content,SECRET) values
('master01', 'user001','삼성 QLED TV 65인치','사이즈가 어느정도 되나요??','Y');
('master01', 'user002','파나소닉 전자레인지','배송언제오나요?','N'),
('master01', 'user003','삼성 갤럭시 워치 5','주말배송가능한가요?','Y');

SELECT id,i_name,(CASE WHEN SECRET = 'Y' THEN
			(SELECT REPLACE(moon_content,moon_content,'*******************') 
				FROM ask)
		ELSE (SELECT MOON_CONTENT FROM ASK)
		end) 문의
FROM ASK;

select id,i_name,()