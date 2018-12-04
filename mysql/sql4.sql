#1.查询工资大于12000的员工姓名和工资

SELECT
	`last_name`,
	`salary`
FROM
	`employees`
WHERE
	`salary`>12000;

#2.查询员工号为176的员工的姓名和部门号和年薪

SELECT
	`last_name`,
	`department_id`,
	`salary`*12*(1+IFNULL(`commission_pct`,0)) AS 年薪
FROM
	employees
WHERE
	`employee_id`=170;
	
#3.选择工资不在5000到12000的员工姓名和工资

SELECT
	`last_name`,
	`salary`
FROM
	`employees`
WHERE
	 salary<5000 || salary>12000;

#------------------------------
SELECT
	`last_name`,
	`salary`
FROM
	`employees`
WHERE
	 NOT(salary>=5000 AND salary<=12000);	
	

