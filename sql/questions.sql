create table questions(topic varchar2(100) constraint quest_topic_nn not null,
                       answer varchar2(1000) constraint quest_ans_nn not null,
                       user_id number(20) not null,
                       constraint q_user_id FOREIGN KEY(user_id) references users); 
