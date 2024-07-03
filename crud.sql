CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
    (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    ('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    ('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    ('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    ('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    ('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    ('Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    ('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    ('Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
    (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2016-02-20 00:00:00'),
    (2, 3000, '2016-06-11 00:00:00'),
    (3, 4000, '2016-02-20 00:00:00'),
    (1, 4500, '2016-02-20 00:00:00'),
    (2, 3500, '2016-06-11 00:00:00');

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
    (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2016-02-20 00:00:00'),
    (2, 'Executive', '2016-06-11 00:00:00'),
    (8, 'Executive', '2016-06-11 00:00:00'),
    (5, 'Manager', '2016-06-11 00:00:00'),
    (4, 'Asst. Manager', '2016-06-11 00:00:00'),
    (7, 'Executive', '2016-06-11 00:00:00'),
    (6, 'Lead', '2016-06-11 00:00:00'),
    (3, 'Lead', '2016-06-11 00:00:00');

-- SELECT * FROM Worker;
-- SELECT * FROM Bonus;
-- SELECT * FROM Title;

-- Select department from Worker group by department;
-- Select distinct department, length(Department) As length from Worker;

-- Select Replace(first_name, 'a', 'A') from Worker;

-- -- Select concat(first_name, ' ', last_name) As Name from Worker;
-- Select * from Worker order by first_name;

-- Select * from Worker Order by Department, first_name DESC;
-- Select first_name, department from Worker order by first_name, department desc;

-- Select * from Worker where first_name NOT IN ('Vipul', 'Satish');

 -- Select * from Worker where first_name IN ('Vipul', 'Satish');

-- Select * from Worker where department LIKE "%admin%";
-- Select * from Worker where Department LIKE "a%";
-- Select * from Worker where first_name LIKE "a%";

-- select department, count(*) As count from Worker where department = 'Admin';


-- Select concat(first_name,' ',last_name) as fullName from Worker where Salary between 50000 and 100000;
-- Select department, count(WORKER_ID) from Worker group by department order by count(WORKER_ID) DESC;

-- Select * from Worker as w inner join Title as t on w.WORKER_ID = t.WORKER_REF_ID where t.WORKER_TITLE = 'Manager';
-- Select w.* from Worker as w inner join Title as t on w.WORKER_ID = t.WORKER_REF_ID where t.WORKER_TITLE = 'Manager';
-- Select t.* from Worker as w inner join Title as t on w.WORKER_ID = t.WORKER_REF_ID where t.WORKER_TITLE = 'Manager';


-- select worker_title, count(*) from Title group by worker_title having count(*) > 1;


-- select * from Worker where (worker_id % 2) = 0;

create table worker_clone like Worker;
insert into worker_clone select * from Worker;
-- select * from worker_clone;

-- select w.* from Worker As w inner join worker_clone using (worker_id)

-- select Worker.* from Worker left join worker_clone using (worker_id) where worker_clone.worker_id is null;


select curdate();
select now();

-- select currdate();

select * from Worker order by salary desc limit 4, 1;

-- select * from Worker w1, Worker w2 where w1.salary = w2.salary and w1.worker.id = w2.worker_id;
