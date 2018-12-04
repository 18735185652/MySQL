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

#8.去重

#案例：查询员工表中涉及到的所有的部门编号
SELECT DISTINCT `department_id` FROM employees; 

#9.+号的作用
/*
java中的+号:
1.运算符，两个操作数都为数值型
2.连接符，只要有一个操作数为字符串

mysql中的+号：
仅仅只有一个功能：运算符
select 100+90; 两个操作数都为数值型，则做加法运算
select '123'+90; 其中一方为字符型，试图将字符型数值转换成数值型，
		 如果转换成功，继续做加法运算
select 'join'+90; 如果转换失败，则将字符型数值转换为0，0+90还是90

select null+10; 只要其中一方为null，则结果肯定为null

*/

#案例：查询员工名和姓连接成一个字段，并显示为 姓名

SELECT 
	CONCAT(last_name,first_name) AS 姓名 
FROM 
	employees;
	
	
#错误写法，不能拼接 0+0=0;
SELECT 
	last_name+first_name AS 姓名
FROM
	employees;
