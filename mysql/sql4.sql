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

#4选择在20或50号部门工作的员工姓名和部门号


SELECT
	`last_name`,
	`department_id`
FROM
	`employees`
WHERE	`department_id`="20" OR department_id="50";

#----------------------------------------------------

SELECT
	`last_name`,
	`department_id`
FROM
	`employees`
WHERE
	department_id IN("20","50");
	
	
#5.选择公司中没有管理者的员工姓名和job_id

SELECT
	`last_name`,
	`job_id`
FROM
	`employees`
WHERE
	`manager_id` IS NULL;

#6.选择公司中没有奖金的员工姓名，工资，和奖金级别

SELECT
	`last_name`,
	`salary`,
	IFNULL(`commission_pct`,0)
FROM
	`employees`
WHERE
	commission_pct IS NULL;
#----------------------------------

SELECT
	`last_name`,
	`salary`,
	IFNULL(`commission_pct`,0)
FROM
	`employees`
WHERE
	commission_pct <=>NULL;
	
#7.选择员工姓名的第三个字母是a的员工姓名


SELECT
	`last_name`
FROM
	employees
WHERE	
	last_name
LIKE
	"__a%"
	

#8查询没有奖金，且工资小于18000的salary，last_name

SELECT
	`last_name`,
	`salary`
FROM
	employees
WHERE
	`commission_pct`<=>NULL AND salary<18000;

#9.查询departments表的结构，如下
+-----------------+------------+------+-----+---------+----------------+
| FIELD           | TYPE       | NULL | KEY | DEFAULT | Extra          |
+-----------------+------------+------+-----+---------+----------------+
| department_id   | INT(4)     | NO   | PRI | NULL    | AUTO_INCREMENT |
| department_name | VARCHAR(3) | YES  |     | NULL    |                |
| manager_id      | INT(6)     | YES  |     | NULL    |                |
| location_id     | INT(4)     | YES  | MUL | NULL    |                |
+-----------------+------------+------+-----+---------+----------------+

DESC departments;

#10.查询部门departments涉及到了哪些位置编号(去重)

SELECT DISTINCT	`location_id` FROM `departments`;


#11.试问 select * from `employees`; 和
#
SELECT * FROM `employees` WHERE	`commission_pct` LIKE "%%" AND `last_name` LIKE "%%";

#执行结果是否一样，并说明原因？

# commission_pct 里面包含了null字段,null为false

#-------------------------------------------------------------------------------------

# or结果和 select * from employess; 一样
SELECT * FROM `employees` WHERE	`commission_pct` LIKE "%%" OR `last_name` LIKE "%%";

  







