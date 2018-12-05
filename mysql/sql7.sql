#进阶4：常见函数

/*
概念：类似于java中的方法，将一组逻辑语句封装在方法体中，对外暴露方法名
好处：1.隐藏了实现细节    2.提高代码的重用性
调用：select 函数名() 【from 表】;
特点：
	1.叫什么(函数名)
	2.干什么(函数功能)
	
分类：
	1.单行函数
	如 concat、length、ifnull等
	2.分组函数
	
	功能： 做统计使用,又称为统计函数，聚合函数、组函数
常见函数：
	字符函数：
		length
		concat
		substr
		instr
		trim
		upper
		lower
		lpad
		rpad
		replace
	数学函数：
		round
		ceil
		floor
		truncate
		mod
	日期函数
		now
		curdate
		curtime
		year
		month
		monthname
		day
		hour
		minute
		second
		str_to_date
		date_format
	其他函数
		version
		database
		user
		
	控制函数
		if
		case

*/



#一、字符函数

#length 获取参数值得字节个数

SELECT LENGTH('join');
SELECT LENGTH('张三丰hahaha');


SHOW VARIABLES LIKE "%char%"


#2.concat 拼接字符串

SELECT CONCAT(`last_name`,'_',`first_name`) AS 姓名 FROM `employees`;

#3.upper 、lower 大小写

SELECT UPPER("join");
SELECT LOWER("JOIN");

#案例：将姓变大写，名变小写，然后拼接

SELECT
	CONCAT(UPPER(last_name),"_",LOWER(first_name))
FROM
	employees;


#4.substr、substring
#注意：索引从1开始
#截取从指定索引处后面所有字符
SELECT SUBSTR('李莫愁爱上了陆展元',7) out_put;

#截取从指定索引处指定字符长度的字符
SELECT SUBSTR('李莫愁爱上了陆展元',1,3)；


#案例：姓名中首字符大写，其他字符小写，然后用_拼接,显示出来

SELECT
	CONCAT(UPPER(SUBSTR(`last_name`,1,1)),'_',LOWER(SUBSTR(last_name,2))) AS out_put
FROM
	employees;
	

#5.instr 返回子串第一次出现的索引，如果找不到返回0


SELECT INSTR("杨不悔爱上了殷梨亭","殷梨亭") AS out_put;

#6.trim 去空格

SELECT LENGTH(TRIM('      张翠山'    ))AS out_put;

# 去除首尾的a 

SELECT TRIM("a" FROM "aaaaaaaaaaaaaaaaa张翠山aaaaaaaa") AS out_put;

#7.lpad 用指定的字符实现左填充指定长度

SELECT LPAD('殷素素',10,'*') AS out_put;

#8.rpad 用指定的字符实现右填充指定长度

SELECT RPAD('殷素素',12,'ab') AS out_put;


#9.replace 替换

SELECT REPLACE("张无忌爱上了周芷若","周芷若","赵敏") AS out_put ;




#二.数学函数
#round 四舍五入

SELECT ROUND(-1.55);

#小数点后保留2位
SELECT ROUND(1.567,2);

#ceil 向上取整,返回>=该参数的最小整数
SELECT CEIL(1.002);

#floor  <=该参数的最大整数
SELECT FLOOR(-9.99);

#truncate 截断

SELECT TRUNCATE(1.69999,1);

#mod取余

MOD(a,b) : a-a/b*b

#被除数为正，结果为正，为负，结果为负
SELECT MOD(10,-3);



#三、日期函数

#now 返回当前系统日期+时间
SELECT NOW();

#curdate 返回当前系统日期，不包含时间
SELECT CURDATE();

#curtime 返回当前时间，不包含日期

SELECT CURTIME();

#可以获取指定的部分，年、月、日、小时、分钟、秒

SELECT YEAR(NOW()) 年;
SELECT YEAR('1994-08-22') 年;

SELECT YEAR(hiredate) 年 FROM `employees`;

SELECT MONTH(NOW()) 月;

#英文月份显示
SELECT MONTHNAME(NOW()) 月;

#str_to_date：将日期格式的字符转换成指定格式的日期

SELECT STR_TO_DATE("1998-3-2","%Y-%c-%d") AS out_put;


#查询 查询入职日期为1992-4-3号的员工信息

SELECT * FROM employees WHERE `hiredate`="1992-4-3";

SELECT * FROM employees WHERE `hiredate`=STR_TO_DATE('4-3 1992','%c-%d %Y');


#date_format 将日期转换成字符

SELECT DATE_FORMAT(NOW(),'%y年%m月%d日') AS out_put;

#查询有奖金的员工名和入职日期(xx月/xx日/xx年)


SELECT
	`last_name`,
	DATE_FORMAT(hiredate,'%m月/%d日 %Y年') AS 入职日期
FROM
	employees;


#四、其他函数

#sql版本
SELECT VERSION();

#所属库
SELECT DATABASE();

#当前用户
SELECT USER();


#五、流程控制函数


#1.if函数：if else 的效果

SELECT IF(10>5,"大","小");


SELECT 
	last_name,`commission_pct`,IF(commission_pct IS NULL,"没奖金，呵呵","有奖金，嘻嘻") AS 奖金 
FROM 
	employees;


#2.case函数的使用一：switch case的效果;

/*
switch(变量或表达式){
	case 常量1: 语句1;break;	
	...
	default:语句;break;

}


mysql中

case 要判断的字段或表达式
when 常量1 then 要显示的值或语句1;
when 常量2 then 要显示的值或语句2;
...
else 要显示的值n或语句n;
end
*/


/*案例 查询员工的工资，要求

部门号=30,,显示的工资为1.1倍
部门号=40,,显示的工资为1.2倍
部门号=50,,显示的工资为1.3倍
其他部门,显示的工资为原工资
*/

SELECT
	salary 原始工资,department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary 
END AS 新工资
FROM
	employees;


#3.case函数的使用二:类似于多重if
/*
java中：
if(条件1){
	语句1
}else if(条件2){
	语句2
}
...
else{
	语句n
}


mesql中

case
when 条件1 then 要显示的值1或语句1
when 条件2 then 要显示的值2或语句2
...
else 要显示的值n或语句n;
end
*/

#案例：查询员工的工资情况
#如果工资>20000,显示A级别
#如果工资>15000,显示B级别
#如果工资>10000,显示C级别

SELECT salary,
CASE
WHEN salary>20000 THEN "A"
WHEN salary>15000 THEN "B"
WHEN salary>10000 THEN "C"
ELSE "D"
END AS 工资级别
FROM
	employees;
	

#1.显示系统时间(注：日期+时间)
SELECT NOW();

#2.查询员工号，姓名，工资，以及工资提高百分之20后的结果(new salary)

SELECT
	employee_id,
	last_name,
	salary,
	salary*1.2 AS "new salary"
FROM
	employees;

#3.将员工的姓名按首字母排序，并写出姓名的长度(length)

SELECT
	LENGTH(last_name) AS 长度,
	SUBSTR(last_name,1,1) AS 首字符,
	last_name
FROM 
	employees
ORDER BY
	首字符;

	
#4. 做一个查询，产生下面的结果

/*
<last_name> ears <salary> monthly but wants <salary*3>
Dream Salary
King earns 24000 monthly but wants 72000
*/

SELECT CONCAT(last_name,'earns',salary,'monthly but wants',salary*3) AS 'Dream Salary'
FROM
	employees
WHERE salary=24000;