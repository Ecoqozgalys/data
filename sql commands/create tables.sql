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


                       