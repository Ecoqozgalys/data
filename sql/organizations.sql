CREATE SEQUENCE ORG_SEQ START WITH 1000 increment by 1;                    
create table organizations(org_id number(20) DEFAULT ORG_SEQ.NEXTVAL constraint org_id_pk primary key,
                    name varchar2(50) constraint org_name_nn not null,
                    address varchar2(50) constraint org_address_nn not null,
                    city varchar2(20) constraint org_city_nn not null,
                    contact number(11) CHECK(REGEXP_LIKE(contact,'[0-9]{11}')),
                    working_time varchar2(200)); 
                    
INSERT INTO organizations VALUES(default,'Kazakhstan Waste Recycling','����������, 81/3 �����','Almaty',77017215573,'mon-fri 10.00-17.30 lunch 14.00-14.30');         
INSERT INTO organizations VALUES(default,'Kagazy Recycling','��.�����-3�, ��.���� ��','Almaty',77017215572,'mon-fri 10.00-17.30 lunch 14.00-14.30');
INSERT INTO organizations VALUES(default,'��� ������� TRADING�','��. ���������, 264 �','Almaty',77015575764,'mon-fri 09.00-13.00');
INSERT INTO organizations VALUES(default,'�HM� � ��� ����� ����-���','��.�����������, 247','Almaty',77470010072,'mon-fri 09.00-20.00');
INSERT INTO organizations VALUES(default,'����������� ������� �ZETA�','��. ��������� �. 225','Almaty',71723007777,'mon-fri 09.00-20.00 sat 09.00-19.00');
    



                       