# SQL-Window-Functions

## Overview

Window functions in SQL are a powerful feature that allows you to perform calculations across a specific subset of rows within a result set. Unlike regular aggregate functions, window functions do not collapse multiple rows into a single value; instead, they retain individual rows in the result while computing a value based on a defined window or partition.

## Key Concepts

- PARTITION BY: This clause divides the result set into partitions or groups based on specified columns. The window function is then applied independently within each partition.

- ORDER BY: This clause defines the ordering of rows within each partition. It ensures that the window function calculations are performed in a specific order, which can be critical for some functions like cumulative sums or running averages.

- ROWS/RANGE: These clauses determine the window frame within which the window function operates. The ROWS clause allows you to specify a fixed number of preceding or following rows, while the RANGE clause allows you to specify a range of values.

- Window Functions: Commonly used window functions include:

       > SUM, AVG, COUNT: Calculate the sum, average, or count of a specific column within the window frame.
       > RANK, DENSE_RANK, ROW_NUMBER: Assign a rank or row number to each row based on the defined ordering.
       > LEAD, LAG: Access the value of a column from a specified number of rows ahead (LEAD) or behind (LAG) the current row.
       > FIRST_VALUE, LAST_VALUE: Retrieve the first or last value from a specified column within the window frame.


## Examples
#### Let's illustrate some use cases with examples:

![image](https://github.com/izhangit/SQL-Window-Functions/assets/108143680/d9faea96-d4f4-41bc-b91d-00dabf8691ed)


![ex 1](https://github.com/izhangit/SQL-Window-Functions/assets/108143680/36bedf87-f47b-433e-bcc2-2bf6fdb3deb9)


![ex](https://github.com/izhangit/SQL-Window-Functions/assets/108143680/2202d323-bc56-4614-9d90-9509d898e421)


![Perceding](https://github.com/izhangit/SQL-Window-Functions/assets/108143680/17e40ac1-ac1b-43d8-98a7-a7c36f215c49)



## Benefits
### Window functions offer several advantages over traditional SQL queries, such as:

- Simplifying complex calculations and avoiding self-joins or subqueries.
- Eliminating the need for intermediate temporary tables, resulting in more efficient queries.
- Providing enhanced analytical capabilities, particularly for time-series data or ranking-related tasks.

## Compatibility
##### Window functions are supported by various SQL database management systems, including PostgreSQL, SQL Server, MySQL, Oracle, and more. However, the syntax and specific functions may vary slightly between different database engines.



## Conclusion
### Window functions in SQL are a valuable tool for performing advanced analytics and gaining deeper insights from your data. By leveraging the power of window functions, you can efficiently solve complex problems, enhance your analytical capabilities, and improve the overall performance of your SQL queries.

