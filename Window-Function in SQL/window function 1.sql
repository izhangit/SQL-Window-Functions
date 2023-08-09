
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| information_schema |           |
| library            |
| mysql              |
| performance_schema |
| sms                |
| sys                |
| windows            |
+--------------------+
10 rows in set (0.00 sec)

mysql> use windows;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_windows |
+-------------------+
| test_data         |
+-------------------+
1 row in set (0.00 sec)

-- create table

mysql> create table employees(
    -> id int auto_increment primary key,
    -> department varchar(255) not null,
    -> salary numeric not null
    -> );
Query OK, 0 rows affected (0.59 sec)

mysql> desc employees;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | int           | NO   | PRI | NULL    | auto_increment |
| department | varchar(255)  | NO   |     | NULL    |                |
| salary     | decimal(10,0) | NO   |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> insert into employees(department,salary) values (engineering,80000);
ERROR 1054 (42S22): Unknown column 'engineering' in 'field list'
mysql> insert into employees(department,salary) values ("engineering",80000);
Query OK, 1 row affected (0.23 sec)

mysql> insert into employees(department,salary) values ("engineering",69000);
Query OK, 1 row affected (0.07 sec)

mysql> insert into employees(department,salary) values ("engineering",70000);
Query OK, 1 row affected (0.37 sec)

mysql> insert into employees(department,salary) values ("engineering",1030000);
Query OK, 1 row affected (0.13 sec)

mysql> insert into employees(department,salary) values ("engineering",67000);
Query OK, 1 row affected (0.12 sec)

mysql> insert into employees(department,salary) values ("engineering",89000);
Query OK, 1 row affected (0.08 sec)

mysql> insert into employees(department,salary) values ("engineering",91000);
Query OK, 1 row affected (0.35 sec)

mysql> insert into employees(department,salary) values ("sales",59000);
Query OK, 1 row affected (0.14 sec)

mysql> insert into employees(department,salary) values ("sales",70000);
Query OK, 1 row affected (0.12 sec)

mysql> insert into employees(department,salary) values ("sales",159000);
Query OK, 1 row affected (0.06 sec)

mysql> insert into employees(department,salary) values ("sales",72000);
Query OK, 1 row affected (0.06 sec)

mysql> insert into employees(department,salary) values ("sales",60000);
Query OK, 1 row affected (0.09 sec)

mysql> insert into employees(department,salary) values ("sales",61000);
Query OK, 1 row affected (0.15 sec)

mysql> insert into employees(department,salary) values ("sales",61000);
Query OK, 1 row affected (0.14 sec)

mysql> insert into employees(department,salary) values ("customer service",38000);
Query OK, 1 row affected (0.13 sec)

mysql> insert into employees(department,salary) values ("customer service",45000);
Query OK, 1 row affected (0.16 sec)

mysql> insert into employees(department,salary) values ("customer service",61000);
Query OK, 1 row affected (0.12 sec)

mysql> insert into employees(department,salary) values ("customer service",40000);
Query OK, 1 row affected (0.04 sec)

mysql> insert into employees(department,salary) values ("customer service",31000);
Query OK, 1 row affected (0.12 sec)

mysql> insert into employees(department,salary) values ("customer service",56000);
Query OK, 1 row affected (0.15 sec)

mysql> insert into employees(department,salary) values ("customer service",55000);
Query OK, 1 row affected (0.13 sec)

mysql> select * from employees;
+----+------------------+---------+
| id | department       | salary  |
+----+------------------+---------+
|  1 | engineering      |   80000 |
|  2 | engineering      |   69000 |
|  3 | engineering      |   70000 |
|  4 | engineering      | 1030000 |
|  5 | engineering      |   67000 |
|  6 | engineering      |   89000 |
|  7 | engineering      |   91000 |
|  8 | sales            |   59000 |
|  9 | sales            |   70000 |
| 10 | sales            |  159000 |
| 11 | sales            |   72000 |
| 12 | sales            |   60000 |
| 13 | sales            |   61000 |
| 14 | sales            |   61000 |
| 15 | customer service |   38000 |
| 16 | customer service |   45000 |
| 17 | customer service |   61000 |
| 18 | customer service |   40000 |
| 19 | customer service |   31000 |
| 20 | customer service |   56000 |
| 21 | customer service |   55000 |
+----+------------------+---------+
21 rows in set (0.00 sec)

mysql> select department from
    -> employee
    -> group by department;


mysql> select department from employees
    -> group by department;
+------------------+
| department       |
+------------------+
| engineering      |
| sales            |
| customer service |
+------------------+
3 rows in set (0.00 sec)

mysql> select * from employees;
+----+------------------+---------+
| id | department       | salary  |
+----+------------------+---------+
|  1 | engineering      |   80000 |
|  2 | engineering      |   69000 |
|  3 | engineering      |   70000 |
|  4 | engineering      | 1030000 |
|  5 | engineering      |   67000 |
|  6 | engineering      |   89000 |
|  7 | engineering      |   91000 |
|  8 | sales            |   59000 |
|  9 | sales            |   70000 |
| 10 | sales            |  159000 |
| 11 | sales            |   72000 |
| 12 | sales            |   60000 |
| 13 | sales            |   61000 |
| 14 | sales            |   61000 |
| 15 | customer service |   38000 |
| 16 | customer service |   45000 |
| 17 | customer service |   61000 |
| 18 | customer service |   40000 |
| 19 | customer service |   31000 |
| 20 | customer service |   56000 |
| 21 | customer service |   55000 |
+----+------------------+---------+
21 rows in set (0.00 sec)

mysql> select *,
    -> avg(salary) over (partition by department) as dept_avg
    -> from employees;
+----+------------------+---------+-------------+
| id | department       | salary  | dept_avg    |
+----+------------------+---------+-------------+
| 15 | customer service |   38000 |  46571.4286 |
| 16 | customer service |   45000 |  46571.4286 |
| 17 | customer service |   61000 |  46571.4286 |
| 18 | customer service |   40000 |  46571.4286 |
| 19 | customer service |   31000 |  46571.4286 |
| 20 | customer service |   56000 |  46571.4286 |
| 21 | customer service |   55000 |  46571.4286 |
|  1 | engineering      |   80000 | 213714.2857 |
|  2 | engineering      |   69000 | 213714.2857 |
|  3 | engineering      |   70000 | 213714.2857 |
|  4 | engineering      | 1030000 | 213714.2857 |
|  5 | engineering      |   67000 | 213714.2857 |
|  6 | engineering      |   89000 | 213714.2857 |
|  7 | engineering      |   91000 | 213714.2857 |
|  8 | sales            |   59000 |  77428.5714 |
|  9 | sales            |   70000 |  77428.5714 |
| 10 | sales            |  159000 |  77428.5714 |
| 11 | sales            |   72000 |  77428.5714 |
| 12 | sales            |   60000 |  77428.5714 |
| 13 | sales            |   61000 |  77428.5714 |
| 14 | sales            |   61000 |  77428.5714 |
+----+------------------+---------+-------------+
21 rows in set (0.00 sec)

mysql>
mysql> select * ,
    -> min(salary) over (partition by department) as min,
    -> max(salary) over (partition by department) as max
    -> from employees;
+----+------------------+---------+-------+---------+
| id | department       | salary  | min   | max     |
+----+------------------+---------+-------+---------+
| 15 | customer service |   38000 | 31000 |   61000 |
| 16 | customer service |   45000 | 31000 |   61000 |
| 17 | customer service |   61000 | 31000 |   61000 |
| 18 | customer service |   40000 | 31000 |   61000 |
| 19 | customer service |   31000 | 31000 |   61000 |
| 20 | customer service |   56000 | 31000 |   61000 |
| 21 | customer service |   55000 | 31000 |   61000 |
|  1 | engineering      |   80000 | 67000 | 1030000 |
|  2 | engineering      |   69000 | 67000 | 1030000 |
|  3 | engineering      |   70000 | 67000 | 1030000 |
|  4 | engineering      | 1030000 | 67000 | 1030000 |
|  5 | engineering      |   67000 | 67000 | 1030000 |
|  6 | engineering      |   89000 | 67000 | 1030000 |
|  7 | engineering      |   91000 | 67000 | 1030000 |
|  8 | sales            |   59000 | 59000 |  159000 |
|  9 | sales            |   70000 | 59000 |  159000 |
| 10 | sales            |  159000 | 59000 |  159000 |
| 11 | sales            |   72000 | 59000 |  159000 |
| 12 | sales            |   60000 | 59000 |  159000 |
| 13 | sales            |   61000 | 59000 |  159000 |
| 14 | sales            |   61000 | 59000 |  159000 |
+----+------------------+---------+-------+---------+
21 rows in set (0.00 sec)

-- using group by with aggregate function

mysql> select department,
    -> avg(salary) as dept_avg,
    -> min(salary) as dept_min,
    -> max(salary) as dept_max
    -> from employees
    -> group by department;
+------------------+-------------+----------+----------+
| department       | dept_avg    | dept_min | dept_max |
+------------------+-------------+----------+----------+
| engineering      | 213714.2857 |    67000 |  1030000 |
| sales            |  77428.5714 |    59000 |   159000 |
| customer service |  46571.4286 |    31000 |    61000 |
+------------------+-------------+----------+----------+
3 rows in set (0.09 sec)

mysql> -- Rank() function
mysql>
mysql> select * ,
    -> rank() over ( order by salary desc)
    -> as overall_rank
    -> from employees;
+----+------------------+---------+--------------+
| id | department       | salary  | overall_rank |
+----+------------------+---------+--------------+
|  4 | engineering      | 1030000 |            1 |
| 10 | sales            |  159000 |            2 |
|  7 | engineering      |   91000 |            3 |
|  6 | engineering      |   89000 |            4 |
|  1 | engineering      |   80000 |            5 |
| 11 | sales            |   72000 |            6 |
|  3 | engineering      |   70000 |            7 |
|  9 | sales            |   70000 |            7 |
|  2 | engineering      |   69000 |            9 |
|  5 | engineering      |   67000 |           10 |
| 13 | sales            |   61000 |           11 |
| 14 | sales            |   61000 |           11 |
| 17 | customer service |   61000 |           11 |
| 12 | sales            |   60000 |           14 |
|  8 | sales            |   59000 |           15 |
| 20 | customer service |   56000 |           16 |
| 21 | customer service |   55000 |           17 |
| 16 | customer service |   45000 |           18 |
| 18 | customer service |   40000 |           19 |
| 15 | customer service |   38000 |           20 |
| 19 | customer service |   31000 |           21 |
+----+------------------+---------+--------------+
21 rows in set (0.10 sec)

mysql> select * ,
    -> rank() over(partition by department order by salary desc)
    -> as dept_rank
    -> from employees;
+----+------------------+---------+-----------+
| id | department       | salary  | dept_rank |
+----+------------------+---------+-----------+
| 17 | customer service |   61000 |         1 |
| 20 | customer service |   56000 |         2 |
| 21 | customer service |   55000 |         3 |
| 16 | customer service |   45000 |         4 |
| 18 | customer service |   40000 |         5 |
| 15 | customer service |   38000 |         6 |
| 19 | customer service |   31000 |         7 |
|  4 | engineering      | 1030000 |         1 |
|  7 | engineering      |   91000 |         2 |
|  6 | engineering      |   89000 |         3 |
|  1 | engineering      |   80000 |         4 |
|  3 | engineering      |   70000 |         5 |
|  2 | engineering      |   69000 |         6 |
|  5 | engineering      |   67000 |         7 |
| 10 | sales            |  159000 |         1 |
| 11 | sales            |   72000 |         2 |
|  9 | sales            |   70000 |         3 |
| 13 | sales            |   61000 |         4 |
| 14 | sales            |   61000 |         4 |
| 12 | sales            |   60000 |         6 |
|  8 | sales            |   59000 |         7 |
+----+------------------+---------+-----------+
21 rows in set (0.00 sec)

