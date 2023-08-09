

mysql>
mysql> -- Quick Assignment Windows Function
mysql>
mysql> -- Q: Offset the LEAD and LAG values by 2 in the output columns?
mysql>
mysql> -- Input
mysql>
mysql> select salary form employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'employees' at line 1
mysql> select salary from employees;
+---------+
| salary  |
+---------+
|   80000 |
|   69000 |
|   70000 |
| 1030000 |
|   67000 |
|   89000 |
|   91000 |
|   59000 |
|   70000 |
|  159000 |
|   72000 |
|   60000 |
|   61000 |
|   61000 |
|   38000 |
|   45000 |
|   61000 |
|   40000 |
|   31000 |
|   56000 |
|   55000 |
+---------+
21 rows in set (0.00 sec)

mysql> -- Output
mysql>
mysql> select salary,
    -> Lead(salary,2) over (order by salary) as "LEAD BY 2",
    -> LAG(salary,2) over (order by salary) as "LAG BY 2"
    -> from employees;
+---------+-----------+----------+
| salary  | LEAD BY 2 | LAG BY 2 |
+---------+-----------+----------+
|   31000 |     40000 |     NULL |
|   38000 |     45000 |     NULL |
|   40000 |     55000 |    31000 |
|   45000 |     56000 |    38000 |
|   55000 |     59000 |    40000 |
|   56000 |     60000 |    45000 |
|   59000 |     61000 |    55000 |
|   60000 |     61000 |    56000 |
|   61000 |     61000 |    59000 |
|   61000 |     67000 |    60000 |
|   61000 |     69000 |    61000 |
|   67000 |     70000 |    61000 |
|   69000 |     70000 |    61000 |
|   70000 |     72000 |    67000 |
|   70000 |     80000 |    69000 |
|   72000 |     89000 |    70000 |
|   80000 |     91000 |    70000 |
|   89000 |    159000 |    72000 |
|   91000 |   1030000 |    80000 |
|  159000 |      NULL |    89000 |
| 1030000 |      NULL |    91000 |
+---------+-----------+----------+
21 rows in set (0.00 sec)

mysql>

