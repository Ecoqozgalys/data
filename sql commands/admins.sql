CREATE SEQUENCE ADMIN_SEQ START WITH 100 increment by 1;
create table admins(admin_id number(20) DEFAULT ADMIN_SEQ.NEXTVAL constraint admin_id_pk primary key,
                    first_name varchar2(20) constraint admin_fn_nn not null,
                    last_name varchar2(20) constraint admin_ln_nn not null,
                    email varchar2(50) CHECK(REGEXP_LIKE(email,'.+@gmail\.com$')),
                    password varchar2(50) CHECK(REGEXP_like(password,'[A-Za-z0-9._%+-]{5,12}')));
                    
INSERT INTO admins VALUES(default,'Altynay','Turzhanova','aponchicw@gmail.com','62442hp');         
INSERT INTO admins VALUES(default,'Zhanel','Oralova','zhanieliechka@gmail.com','zhanel01');
INSERT INTO admins VALUES(default,'Bekzat','Yernat','polyatomicion@gmail.com','polyholy00');                     


                       