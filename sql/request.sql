create table request(req_date DATE DEFAULT SYSDATE,
                    material_type varchar2(100) constraint req_type_nn not null,
                    user_id number(20) not null,
                    org_id number(20) not null,
                    constraint req_user_id FOREIGN KEY(user_id) references users,
                    constraint req_org_id FOREIGN KEY(org_id) references organizations);                          
                 
                   