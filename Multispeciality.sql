create database Multispeciality;
show databases;
use Multispeciality;

create table Doctor_info(
Dr_id int primary key,
Dr_name varchar(50),
Gender varchar(20),
Contact_no varchar(20),
Dr_position varchar(30),
Joining_date date,
Address varchar(30)
 );
 
 insert into Doctor_info values("1","Ritesh Varma","Male","9845625841","Neurologist","2012-06-11","Mumbai");
 select * from Doctor_info;
 insert into Doctor_info values("2","Vina Thombre","Female","7845645841","Gynecologist","2015-11-21","Thane"), 
 ("3","Aditya Advani","Male","8845625825","Arthopedic","2019-03-17","Aurangabad"),
 ("4","Sagar Shinde","Male","9578625691","Physician","2019-07-03","Nashik"),
 ("5","Leena Sharma","Female","9925689451","Lesar Specialist","2020-12-22","Kalyan"),
 ("6","Mona Kothari","Female","7846523165","Homeopathic","2021-02-19","Mumbai"),
 ("7","Santosh Taware","Male","6325484251","Skin Specialist","2022-01-13","Pune");
 select * from Doctor_info;
 alter table Doctor_info add Sex varchar(10);
 alter table Doctor_info drop Sex;
alter table Doctor_info1 rename to Doctor_info;
 alter table Doctor_info change Joining_date Jng_date date;
 alter table Doctor_info modify Dr_name varchar(100);
 update Doctor_info set Joining_date="2020-12-25" where Dr_id="4";
 select * from Doctor_info where Joining_date between  "2019-01-01" and "2019-05-31";
 desc Doctor_info;
 
 create table Patient_info(
 Pat_id int primary key,
 Pat_name varchar(30),
 Contact_no varchar(20),
 Address varchar(25),
 Admission_date date,
 Dr_id int,
foreign key (Dr_id) references Doctor_info(Dr_id)
 );
desc Patient_info;
show tables;

insert into Patient_info values("01","Ganesh Rahane","8745652312","Dombivali","2019-12-20","1");
select * from Patient_info;
insert into Patient_info values("02","Siya Kale","8644252512","Rahata","2020-03-14","2"),
("03","Radha Nikam","9658421524","Panvel","2020-07-18","3"),
("04","Dev Mishra","7758421565","Karjat","2021-04-04","4"),
("05","Vinay Devare","9955441235","Satara","2021-08-30","5"),
("06","Rahul Pant","6758459875","Latur","2022-01-15","6"),
("07","Meena Oswal","883568545","Kolhapur","2022-01-30","7");
update Patient_info set Address="Dombivali" where Pat_id="03";
select * from Patient_info where Address="Dombivali";
select* from Patient_info where month(Admission_date) between 01 and 05;
select * from Patient_info where date(Admission_date) between "2012-12-05" and "2022-01-25";
select * from Patient_info where year(Admission_date) between 2012 and 2020;
select* from Patient_info where month(Admission_date)=5;
select* from Patient_info where year(Admission_date)="2022";
select* from Patient_info where date(Admission_date)="2012-12-05";
select* from Patient_info where Admission_date in("2019-12-20", "2020-07-18");
select * from Patient_info where Address like "%li";
select * from Patient_info where Address like "Dombiv_li";
select distinct Address from Patient_info;
select distinct Pat_name from Patient_info;
select * from Patient_info order by Admission_date desc;
select * from Patient_info order by Admission_date;

 create table App_info(
 App_no int primary key,
 App_date date,
 App_time time,
 Dr_id int,
 Pat_id int,
 foreign key (Dr_id) references Doctor_info(Dr_id),
 foreign key (Pat_id) references Patient_info(Pat_id)
 );
 insert into App_info values("001","2019-12-19","15:09:00","1","01"),
 ("002","2020-03-13","10:00:00","2","02"),
 ("003","2020-07-17","01:19:00","3","03"),
 ("004","2021-04-03","21:00:00","4","04"),
 ("005","2021-08-29","05:45:00","5","05"),
 ("006","2022-01-14","15:00:00","6","06"),
 ("007","2022-01-29","20:20:00","7","07");
 select * from App_info;

select d.Dr_name,d.Dr_position,p.Pat_name,p.Admission_date,a.App_date
from Doctor_info d
inner join Patient_info p
on d.Dr_id=p.Pat_id
inner join App_info a
on p.Pat_id=a.App_no;

select d.Dr_name,d.Contact_no,p.Pat_name,a.App_date
from Doctor_info d
left join Patient_info p
on d.Dr_id=p.Pat_id
left join App_info a
on p.Pat_id=a.App_no;

select d.Dr_name,d.Contact_no,p.Pat_name,a.App_date,a.App_time
from Doctor_info d
right join Patient_info p
on d.Dr_id=p.Pat_id
right join App_info a
on p.Pat_id=a.App_no;

select concat(d.Dr_name,"/",d.Contact_no),concat(p.Pat_name,"/",a.App_no)
from Doctor_info d
cross join Patient_info p
cross join App_info a
;

create view Doctors as select Dr_id, Dr_name,Dr_position,Contact_no from Doctor_info;
show tables;
select * from Doctors;
insert into Doctors values (8,"Sachin Pawar","Neurosergeon","8546236542");
select * from Doctor_info;

create view DrStaff as select Dr_id,Dr_name,Joining_date from Doctor_info;
update Doctor_info set Joining_date="2022-05-05" where Dr_id=8;
select * from DrStaff;

drop view Doctors;

