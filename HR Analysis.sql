select * from hrdata

--Tổng số nhân viên 
select count(EmpID) as total_employees
from hrdata
--số lượng nhân viên nghỉ việc
select count(EmpID) as Attrition
from hrdata
where Attrition = 1
--Tỷ lệ nghỉ việc 
select round((select count(EmpID) from hrdata where Attrition = 1)*100/count(*), 2) as pct_attrition
from hrdata
--Lương trung bình 
select avg(MonthlyIncome) as avg_salary
from hrdata
--tuổi trung bình 
select avg(Age) as age 
from hrdata
--năm làm việc trung bình 
select avg(YearsAtCompany)  
from hrdata

--Số nhân viên theo giới tính 
select Gender,count(EmpID)
from hrdata
group by Gender
--Số nhân viên nghỉ việc theo giới tính 
select Gender, count(EmpID) 
from hrdata
where Attrition = 1
group by Gender

--Số nhân viên nghỉ việc theo nhóm tuổi 
select AgeGroup, count(EmpID)
from hrdata
group by AgeGroup
order by count(EmpID)

--Tỷ lệ nhân viên nghỉ việc theo tình trạng hôn nhân
select MaritalStatus, round((cast(count(EmpID) as numeric)/(select count(EmpID)
		from hrdata where Attrition = 1))*100, 2) as pct_total
from hrdata
where Attrition = 1
group by MaritalStatus

--Tỷ lệ nhân viên nghỉ việc theo giới tính và từng nhóm tuổi 
select Gender, AgeGroup, round(cast(count(EmpID) as decimal(4,2))/(select count(EmpID) from hrdata where Attrition = 1)*100, 2) as pct_total
from hrdata
where Attrition =1 
group by Gender, AgeGroup
order by AgeGroup
--số nhân viên nghỉ việc theo chuyên ngành học 
select EducationField, count(EmpID) 
from hrdata
where Attrition =1 
group by EducationField
order by count(EmpID) 

--tỉ lệ nhân viên nghỉ việc theo department 
select Department, count(EmpID),  
round((cast(count(EmpID) as numeric) / (select count(EmpID) from hrdata 
where Attrition= 1)) * 100, 2) as percentage_total 
from hrdata  
where Attrition=1
group by Department  
order by count(EmpID) desc

--Số lượng nhân viên theo mức độ hài lòng về môi trường
select EnvironmentSatisfaction, count(EmpID)
from hrdata
group by EnvironmentSatisfaction 
--Tỷ lệ nhân viên nghỉ việc theo mức độ hài lòng về công việc 
select JobSatisfaction, count(EmpID),  
round((cast(count(EmpID) as numeric) / (select count(EmpID) from hrdata 
where Attrition= 1)) * 100, 2) as percentage_total 
from hrdata  
where Attrition=1
group by JobSatisfaction
order by count(EmpID) desc

--Số lượng nhân viên nghỉ việc theo từng vị trí 
select JobRole, count(EmpID)
FROM hrdata
where Attrition = 1
group by JobRole
order by count(EmpID) desc

--TỶ lệ nghỉ việc theo job level 
select JobLevel, count(EmpID),  
round((cast(count(EmpID) as numeric) / (select count(EmpID) from hrdata 
where Attrition= 1)) * 100, 2) as percentage_total 
from hrdata  
where Attrition=1
group by JobLevel 
order by count(EmpID) desc