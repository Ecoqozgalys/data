create table brands(org_id number(20) not null,
                    sales varchar2(200) constraint brand_sales_nn not null,
                    constraint brand_org_id FOREIGN KEY(org_id) references organizations);  
                    
insert into brands values(1004,'10% discount on production');
insert into brands values(1003,'25% discount on plastic goods');   

select name o,sales b from organizations o join brands b on o.org_id=b.org_id; 