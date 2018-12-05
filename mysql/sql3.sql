#进阶2 条件查询

/*
123代表语句的执行顺序

语法：
	select 
		查询列表 3
	from
		表名 1
	where
		筛选条件; 2

分类:
	一.按条件表达式筛选
	
	
	条件运算符: 
		> < = != <> >= <=
	
	二.按逻辑表达式筛选
	
	作用：用于连接条件表达式
	
	逻辑运算符：
		&   || !
	        and or not
	&&和and：两个条件都为true，结果为true，反之为false
	||和or ：只要有一个条件为true，结果为true，反之为false
	!和not : 如果连接的条件本身为false,结果为true,反之为false 
	       
	三.模糊查询
		like
		between and
		in
		is null
		
*/

#一.按条件表达式筛选

#案例1：查询工资>12000的员工信息

SELECT 
	* 
FROM 
	employees 
WHERE 
	salary>12000;
	
#案例2：查询部门编号不等于90号的员工名和部门编号

SELECT 
	last_name,department_id
FROM
	employees
WHERE
	department_id<>90;
	
#二.按逻辑表达式筛选

#案例1：查询工资在10000-20000之间的员工名、工资以及奖金


SELECT
	`first_name`,`salary`,`commission_pct`
FROM
	employees
WHERE
	salary>=10000 AND salary<=20000;
	
	
#案例2：部门编号不是在90到110之间,或者工资高于15000的员工信息


SELECT 
	*
FROM
	employees
WHERE
	department_id<90 OR department_id>110 OR salary>15000;
	
#或者


SELECT 
	*
FROM
	employees
WHERE
	NOT(department_id>=90 AND department_id<=110) OR salary>15000;


#三.模糊查询

/*

like
特点:
1.一般和通配符搭配使用
	通配符：
		% 任意多个字符
		_ 任意单个字符


between and
in
is null|is not null

*/

#1.like
#案例1：查询员工名中包含字符a的员工信息

SELECT 
	*
FROM
	employees
WHERE
	last_name 
LIKE
	'%a%';

#案例2： 查询员工名中第三个字符为n，第五个字符为l的员工名和工资；


SELECT
	last_name,
	salary
FROM
	employees
WHERE
	last_name
LIKE
	"__n_l%";
	
#案例3：查询员工名中第二个字符为_的员工名	

SELECT
	`last_name`
FROM
	employees
WHERE	
	last_name
LIKE
	"_\_%";
	
#或者  $后面的_转义 可以 escape 前面自定义的一个字符，mysql推荐 escape转义

SELECT
	`last_name`
FROM
	employees.
WHERE	
	last_name
LIKE
	"_$_%" ESCAPE "$";


#2.between and 
/*
1.使用 between and 提高语句简洁度
2.包含临界值
3.两个临界值不要替换顺序，完全等价于 employee_id>=100 AND employee_id<=120;

*/

#案例1：查询员工编号在100到120之间的员工信息

SELECT
	*
FROM
	employees
WHERE
	employee_id>=100 AND employee_id<=120;
#---------------------------------------------------

#或者

SELECT
	*
FROM
	employees
WHERE
	employee_id 
BETWEEN 100 AND 120;

#3.in
/*
含义：判断某字段的值是否属于in列表中的某一项
特点: 
	1.使用in提高语句简洁度
	2.in列表的值类型必须统一或兼容(隐式类型转换)
	3.不支持通配符

*/

#案例：查询员工的工种是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号

SELECT
	last_name,
	job_id
FROM 
	employees
WHERE
	job_id='IT_PROT' OR job_id='AD_VP' OR job_id='AD_PRES'
	
#-----------------------------------------------------------------	

SELECT
	last_name,
	job_id
FROM 
	employees
WHERE
	job_id IN('IT_PROT','AD_VP','AD_PRES');
	
#4、 is null

#案例1： 查询没有奖金的员工名和奖金率

/* 
 
=或<>不能判断null值 
is null或 is not null可以判断null值

*/
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL;
	
#5 is not null
	
#案例1： 查询有奖金的员工名和奖金率	

SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;
	
	
#安全等于: <=>

#案例1： 查询没有奖金的员工名和奖金率

SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct <=>NULL;
	
#案例2：查询工资为12000的员工信息


SELECT 
	last_name,
	salary
FROM 
	employees 
WHERE 
	salary<=>12000;

# is null pk <=>

# is null：仅仅可以判断null值，可读性较高
# <=>:既可以判断null值，又可以判断普通的数值，可读性较低

	
	