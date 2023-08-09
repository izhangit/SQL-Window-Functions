-- Ranking Function

mysql> use windows;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_windows |
+-------------------+
| employees         |
| test_data         |
+-------------------+
2 rows in set (0.00 sec)

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

mysql> select salary ,
    -> row_number() over (order by salary) as "Row_number",
    -> rank() over (order by salary) as "Rank",
    -> dense_rank() over (order by salary) as "Desne_Rank",
    -> percent_rank() over (order by salary) as "Percent_rank",
    -> from employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from employees' at line 6
mysql> select salary ,
    -> row_number() over (order by salary) as "Row_number",
    -> rank() over (order by salary) as "Rank",
    -> dense_rank() over (order by salary) as "Desne_Rank",
    -> percent_rank() over (order by salary) as "Percent_rank"
    -> from employees;
+---------+------------+------+------------+--------------+
| salary  | Row_number | Rank | Desne_Rank | Percent_rank |
+---------+------------+------+------------+--------------+
|   31000 |          1 |    1 |          1 |            0 |
|   38000 |          2 |    2 |          2 |         0.05 |
|   40000 |          3 |    3 |          3 |          0.1 |
|   45000 |          4 |    4 |          4 |         0.15 |
|   55000 |          5 |    5 |          5 |          0.2 |
|   56000 |          6 |    6 |          6 |         0.25 |
|   59000 |          7 |    7 |          7 |          0.3 |
|   60000 |          8 |    8 |          8 |         0.35 |
|   61000 |          9 |    9 |          9 |          0.4 |
|   61000 |         10 |    9 |          9 |          0.4 |
|   61000 |         11 |    9 |          9 |          0.4 |
|   67000 |         12 |   12 |         10 |         0.55 |
|   69000 |         13 |   13 |         11 |          0.6 |
|   70000 |         14 |   14 |         12 |         0.65 |
|   70000 |         15 |   14 |         12 |         0.65 |
|   72000 |         16 |   16 |         13 |         0.75 |
|   80000 |         17 |   17 |         14 |          0.8 |
|   89000 |         18 |   18 |         15 |         0.85 |
|   91000 |         19 |   19 |         16 |          0.9 |
|  159000 |         20 |   20 |         17 |         0.95 |
| 1030000 |         21 |   21 |         18 |            1 |
+---------+------------+------+------------+--------------+
21 rows in set (0.10 sec)