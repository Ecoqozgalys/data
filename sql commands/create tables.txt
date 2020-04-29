CREATE SEQUENCE USER_SEQ START WITH 100 increment by 1;
create table users(user_id number(20) DEFAULT USER_SEQ.NEXTVAL constraint user_id_pk primary key,
                    first_name varchar2(20) constraint user_fn_nn not null,
                    last_name varchar2(20) constraint user_ln_nn not null,
                    city varchar2(20) constraint user_city_nn not null, 
                    phone number(11) constraint user_phone_nn not null, 
                    email varchar2(50) CHECK(REGEXP_LIKE(email,'.+@gmail\.com$')),
                    password varchar2(50) CHECK(REGEXP_like(password,'[A-Za-z0-9._%+-]{5,12}')));
                    
INSERT INTO USERS VALUES(default,'Vinnie','Pooh','Almaty',77788787597,'vinniethepooh@gmail.com','ASDqwe123');         
INSERT INTO USERS VALUES(default,'Donald','Duck','Almaty',87022319612,'donaldtheduck@gmail.com','ZXCvbn456');
INSERT INTO USERS VALUES(default,'Trisha','Vang','Almaty',77788787507,'trishavang@gmail.com','heyyotrisha112'); 

CREATE SEQUENCE ADMIN_SEQ START WITH 100 increment by 1;
create table admins(admin_id number(20) DEFAULT ADMIN_SEQ.NEXTVAL constraint admin_id_pk primary key,
                    first_name varchar2(20) constraint admin_fn_nn not null,
                    last_name varchar2(20) constraint admin_ln_nn not null,
                    email varchar2(50) CHECK(REGEXP_LIKE(email,'.+@gmail\.com$')),
                    password varchar2(50) CHECK(REGEXP_like(password,'[A-Za-z0-9._%+-]{5,12}')));
                    
INSERT INTO admins VALUES(default,'Altynay','Turzhanova','aponchicw@gmail.com','62442hp');         
INSERT INTO admins VALUES(default,'Zhanel','Oralova','zhanieliechka@gmail.com','zhanel01');
INSERT INTO admins VALUES(default,'Bekzat','Yernat','polyatomicion@gmail.com','polyholy00');     

CREATE SEQUENCE ORG_SEQ START WITH 1000 increment by 1;                    
create table organizations(org_id number(20) DEFAULT ORG_SEQ.NEXTVAL constraint org_id_pk primary key,
                    name varchar2(50) constraint org_name_nn not null,
                    address varchar2(50) constraint org_address_nn not null,
                    city varchar2(20) constraint org_city_nn not null,
                    contact number(11) CHECK(REGEXP_LIKE(contact,'[0-9]{11}')),
                    working_time varchar2(200)); 
                    
INSERT INTO organizations VALUES(default,'Kazakhstan Waste Recycling','Тимирязева, 81/3 киоск','Almaty',77017215573,'mon-fri 10.00-17.30 lunch 14.00-14.30');         
INSERT INTO organizations VALUES(default,'Kagazy Recycling','мн.Аксай-3а, ул.Толе би','Almaty',77017215572,'mon-fri 10.00-17.30 lunch 14.00-14.30');
INSERT INTO organizations VALUES(default,'ТОО «КАРИНА TRADING»','ул. Казыбаева, 264 А','Almaty',77015575764,'mon-fri 09.00-13.00');
INSERT INTO organizations VALUES(default,'«H&M» в ТРЦ «Мега Алма-Ата»','ул.Розыбакиева, 247','Almaty',77470010072,'mon-fri 09.00-20.00');
INSERT INTO organizations VALUES(default,'Центральный магазин «ZETA»','пр. Райымбека д. 225','Almaty',71723007777,'mon-fri 09.00-20.00 sat 09.00-19.00');
    
create table questions(topic varchar2(100) constraint quest_topic_nn not null,
                       answer varchar2(1000) constraint quest_ans_nn not null,
                       user_id number(20) not null,
                       constraint q_user_id FOREIGN KEY(user_id) references users); 

create table faq(question varchar2(500) not null,
                 answer varchar2(1000));       
                 
create table request(req_date DATE DEFAULT SYSDATE,
                    material_type varchar2(100) constraint req_type_nn not null,
                    user_id number(20) not null,
                    org_id number(20) not null,
                    constraint req_user_id FOREIGN KEY(user_id) references users,
                    constraint req_org_id FOREIGN KEY(org_id) references organizations);                          
                 
CREATE SEQUENCE BLOG_SEQ START WITH 100 INCREMENT BY 1;                   
create table blog(blog_id number(20) DEFAULT BLOG_SEQ.NEXTVAL constraint blog_id_pk primary key,
                    topic varchar2(25) constraint blog_topic_nn not null,
                    header varchar2(25) constraint blog_header_nn not null,
                    main_content varchar2(255) constraint blog_content_nn not null,
                    org_id number(20) not null,
                    constraint blog_org_id FOREIGN KEY(org_id) references organizations);     
create table brands(org_id number(20) not null,
                    sales varchar2(200) constraint brand_sales_nn not null,
                    constraint brand_org_id FOREIGN KEY(org_id) references organizations);  
                    
insert into brands values(1004,'10% discount on production');
insert into brands values(1005,'25% discount on plastic goods');   

select name o,sales b from organizations o join brands b on o.org_id=b.org_id; 

create table materials(org_id number(20) not null,
                    material_type varchar2(100) constraint materials_type_nn not null,
                    constraint mat_org_id FOREIGN KEY(org_id) references organizations); 
select * from materials order by org_id;                   
insert into materials values(1000,'макулатура');
insert into materials values(1000,'тетрапак');
insert into materials values(1000,'пластик №1,2,5');
insert into materials values(1002,'макулатура');
insert into materials values(1003,'тетрапак');
insert into materials values(1003,'полиэтилен');
insert into materials values(1004,'трикотаж');
insert into materials values(1003,'пластик №1,2,4,5,6');
