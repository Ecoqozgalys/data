CREATE SEQUENCE BLOG_SEQ START WITH 100 INCREMENT BY 1;                   
create table blog(blog_id number(20) DEFAULT BLOG_SEQ.NEXTVAL constraint blog_id_pk primary key,
                    topic varchar2(25) constraint blog_topic_nn not null,
                    header varchar2(25) constraint blog_header_nn not null,
                    main_content varchar2(255) constraint blog_content_nn not null);     
