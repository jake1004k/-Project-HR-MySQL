create DATABASE project_hr;
USE project_hr;

show tables;


select * from hr;

set sql_safe_updates =0;


alter table hr
change column ï»¿id emp_id varchar(20);

desc hr;

select birthdate from hr;
update hr
set birthdate = case
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

alter table hr
modify column birthdate date;

update hr
set hire_date = case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;
alter table hr
modify hire_date date;




select termdate from hr;
update hr
set termdate=date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != '';
UPDATE hr
SET termdate = NULL
WHERE termdate = '';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

alter table hr
add column age int;
update hr 
set age = timestampdiff(year,birthdate, curdate());

select age from hr;
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;











