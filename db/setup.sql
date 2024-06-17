/*!40101 SET NAMES utf8 */;

-- 创建数据库 pub
drop database if exists `pub`;
create database `pub`;

-- 创建表 pub.sc
create table pub.sc (
    sid varchar(12) not null,
    cid varchar(12) not null,
    score numeric(6,1)
);

-- 插入数据到 pub.sc
insert into pub.sc values ('123456789011', '098765432100', 90);

-- 创建表 pub.student
create table pub.student (
    sid varchar(12) not null,
    name varchar(12) not null,
    major varchar(12)
);

-- 插入数据到 pub.student
insert into pub.student values ('123456789011', 'gjc', 'CS');

-- 删除已存在的用户和数据库
drop user if exists 'student1';
drop database if exists `student1`;

-- 创建用户 student1，并授予权限
create user 'student1'@'%' identified by '123456';
create database `student1`;
grant all on student1.* to 'student1' with grant option;
grant select on pub.* to 'student1';

-- 删除已存在的用户和数据库
drop user if exists 'student2';
drop database if exists `student2`;

-- 创建用户 student2，并授予权限
create user 'student2'@'%' identified by '123456';
create database `student2`;
grant all on student2.* to 'student2' with grant option;
grant select on pub.* to 'student2';

-- 创建数据库 answer
drop database if exists `answer`;
create database `answer`;

-- 创建表 answer.test0_0
create table answer.test0_0(
    sid varchar(12) not null,
    name varchar(12) not null
);

-- 插入数据到 answer.test0_0
insert into answer.test0_0 values('777', 'lcx');
insert into answer.test0_0 values('635', 'zmq');
insert into answer.test0_0 values('865', 'cs');

-- 创建表 answer.test0_1
create table answer.test0_1(
    sid varchar(12) not null,
    name varchar(12) not null
);

-- 插入数据到 answer.test0_1
insert into answer.test0_1 values('862', 'cs');

-- 创建数据库 manage
drop database if exists `manage`;
create database `manage`;
use manage;

-- 创建表 record
create table record(
    sid varchar(12) not null,
    submission_time datetime not null,
    test_id varchar(12) not null,
    result varchar(30) not null
);

-- 创建表 test_table
create table test_table(
    test_id varchar(12) not null,
    test_name varchar(12) not null,
    test_desc text not null,
    set_id varchar(12) not null
);

-- 插入数据到 test_table
insert into test_table values ('test0_0', '测试题目', '创建一个表test0_0，有两列    sid varchar(12) not null,
    name varchar(12) not null， 插入三条数据("777", "lcx")、("635", "zmq")、("865", "cs")', '0');
insert into test_table values ('test0_1', '测试题目2', '创建一个表test0_1，有两列    sid varchar(12) not null,
    name varchar(12) not null， 插入一条数据("862", "cs")', '0');

-- 创建表 student_info
create table student_info(
    sid varchar(12) not null,
    sql_name varchar(20) not null
);

-- 创建视图 student_score
create view student_score as
    select sid, count(*) total_score
    from record
    where result='success'
    group by sid;

-- 新添加的题目和答案

-- 题目1
create table answer.test1_0(
    sid varchar(12) not null,
    name varchar(12) not null
);
insert into answer.test1_0 values('001', 'Alice');
insert into answer.test1_0 values('002', 'Bob');

-- 题目2
create table answer.test1_1(
    sid varchar(12) not null,
    name varchar(12) not null,
    age int not null
);
insert into answer.test1_1 values('003', 'Charlie', 25);
insert into answer.test1_1 values('004', 'David', 30);
insert into answer.test1_1 values('005', 'Eva', 22);

-- 题目3
create table answer.test2_0(
    sid varchar(12) not null,
    score numeric(4,1) not null
);
insert into answer.test2_0 values('006', 88.5);
insert into answer.test2_0 values('007', 92.0);

-- 题目4
create table answer.test2_1(
    sid varchar(12) not null,
    cid varchar(12) not null,
    score numeric(5,2) not null
);
insert into answer.test2_1 values('008', 'c001', 78.50);
insert into answer.test2_1 values('009', 'c002', 85.75);
insert into answer.test2_1 values('010', 'c003', 90.00);

-- 题目5
create table answer.test3_0(
    sid varchar(12) not null,
    name varchar(12) not null,
    major varchar(12) not null,
    graduation_year int not null
);
insert into answer.test3_0 values('011', 'Frank', 'Math', 2023);
insert into answer.test3_0 values('012', 'Grace', 'Physics', 2024);
insert into answer.test3_0 values('013', 'Heidi', 'CS', 2022);

-- 题目6
create table answer.test3_1(
    sid varchar(12) not null,
    address varchar(50) not null
);
insert into answer.test3_1 values('014', '123 Main St');
insert into answer.test3_1 values('015', '456 Maple Ave');

-- 题目7
create table answer.test4_0(
    cid varchar(12) not null,
    cname varchar(20) not null,
    credits int not null
);
insert into answer.test4_0 values('c101', 'Database', 3);
insert into answer.test4_0 values('c102', 'Algorithm', 4);
insert into answer.test4_0 values('c103', 'Operating Systems', 3);

-- 题目8
create table answer.test4_1(
    sid varchar(12) not null,
    phone varchar(15) not null,
    email varchar(30) not null
);
insert into answer.test4_1 values('016', '123-456-7890', 'alice@example.com');
insert into answer.test4_1 values('017', '987-654-3210', 'bob@example.com');

-- 题目9
create table answer.test5_0(
    sid varchar(12) not null,
    course_id varchar(12) not null,
    semester varchar(10) not null,
    grade numeric(3,1) not null
);
insert into answer.test5_0 values('018', 'CS101', 'Spring 2023', 87.5);
insert into answer.test5_0 values('019', 'PHYS201', 'Fall 2022', 92.3);
insert into answer.test5_0 values('020', 'MATH301', 'Summer 2023', 85.0);

-- 题目10
create table answer.test5_1(
    student_id varchar(12) not null,
    course_code varchar(8) not null,
    enrollment_date date not null,
    completion_status varchar(15) not null
);
insert into answer.test5_1 values('021', 'CS102', '2023-01-15', 'Completed');
insert into answer.test5_1 values('022', 'PHYS202', '2022-09-20', 'Completed');
insert into answer.test5_1 values('023', 'MATH302', '2023-07-05', 'In Progress');
