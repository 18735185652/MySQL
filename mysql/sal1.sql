# 进阶一：基础查询
/*
语法：
select 查询列表 from 表名;

类似于：System.out.println(打印的东西);

特点：

1.查询列表可以是：表中的字段、常量、表达式、函数
2.查询的结果是一个虚拟的表格
*/

USE myemployees;  #打开库名

#1.查询表中的单个字段

SELECT last_name FROM employees;

#2.查询表中的多个字段(字段之用逗号隔开)
SELECT last_name,salary,email FROM employees;

#3查询表中的所有字段
SELECT * FROM employees;

#`用来区分字段和关键字`
SELECT 
	`first_name`,
	`last_name`,
	`email`,
	`phone_number`,
	`job_id`,
	`salary`,
	`commission_pct`,
	`manager_id`,
	`department_id`,
	`hiredate` 
FROM 
	employees;
	
	
#4.查询常量值

SELECT 100;
SELECT 'join';

#5.查询表达式

SELECT 100*98;
SELECT 100%98;	

#6.查询函数
SELECT VERSION();

#7.起别名
/*
1.便于理解
2.如果要查询的字段有重名的情况，取别名可以区分开
*/
#方式一:使用as
SELECT 100%98 AS 结果;
SELECT last_name AS 姓,first_name AS 名 FROM employees; 

#方式二:使用空格
SELECT last_name 姓,first_name 名 FROM employees;	

#案例：查询工资salary，显示的结果为out put

SELECT salary AS "out put" FROM employees;	
