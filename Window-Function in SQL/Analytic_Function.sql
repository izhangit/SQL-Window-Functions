mysql>
mysql> -- Analytic Function
mysql>
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

mysql> select salary,
    -> first_value(salary) over (order by salary) as "First_value",
    -> Last_value(salary) over (order by salary) as "Last_value",
    -> Lead(salary) over (order by salary) as "Lead",
    -> Lag(salary) over (order by salary) as "Lag"
    -> from employees;
+---------+-------------+------------+---------+--------+
| salary  | First_value | Last_value | Lead    | Lag    |
+---------+-------------+------------+---------+--------+
|   31000 |       31000 |      31000 |   38000 |   NULL |
|   38000 |       31000 |      38000 |   40000 |  31000 |
|   40000 |       31000 |      40000 |   45000 |  38000 |
|   45000 |       31000 |      45000 |   55000 |  40000 |
|   55000 |       31000 |      55000 |   56000 |  45000 |
|   56000 |       31000 |      56000 |   59000 |  55000 |
|   59000 |       31000 |      59000 |   60000 |  56000 |
|   60000 |       31000 |      60000 |   61000 |  59000 |
|   61000 |       31000 |      61000 |   61000 |  60000 |
|   61000 |       31000 |      61000 |   61000 |  61000 |
|   61000 |       31000 |      61000 |   67000 |  61000 |
|   67000 |       31000 |      67000 |   69000 |  61000 |
|   69000 |       31000 |      69000 |   70000 |  67000 |
|   70000 |       31000 |      70000 |   70000 |  69000 |
|   70000 |       31000 |      70000 |   72000 |  70000 |
|   72000 |       31000 |      72000 |   80000 |  70000 |
|   80000 |       31000 |      80000 |   89000 |  72000 |
|   89000 |       31000 |      89000 |   91000 |  80000 |
|   91000 |       31000 |      91000 |  159000 |  89000 |
|  159000 |       31000 |     159000 | 1030000 |  91000 |
| 1030000 |       31000 |    1030000 |    NULL | 159000 |
+---------+-------------+------------+---------+--------+
21 rows in set (0.00 sec)

mysql> -- Note:    if you just want the single last value form whole column , use : "ROWS BETWEEN UNBOUNDED PERCEDING AND UNBOUNDING FOLLOWING".
mysql>
