create table materials(org_id number(20) not null,
                    material_type varchar2(100) constraint materials_type_nn not null,
                    constraint mat_org_id FOREIGN KEY(org_id) references organizations); 
insert into materials values(1000,'����������');
insert into materials values(1000,'��������');
insert into materials values(1000,'������� �1,2,5');
insert into materials values(1001,'����������');
insert into materials values(1003,'��������');
insert into materials values(1003,'����������');
insert into materials values(1003,'��������');
insert into materials values(1002,'������� �1,2,4,5,6');

select * from materials order by org_id;                   
