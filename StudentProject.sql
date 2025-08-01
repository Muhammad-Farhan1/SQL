CREATE DATABASE Student_Performance ;
USE Student_Performance;

CREATE TABLE students(
	std_id int primary key,
    name varchar(255) not null,
	subject varchar(40),
    subject_score int not null,
    gender ENUM('Male', 'Female'),
    city varchar(50)
);

insert into students
(std_id , name , subject , subject_score , gender , city)
values
(1 , 'Ria' , 'Maths' , 89 , 'Female' , 'Lahore'),
(2 , 'Rehan' , 'Maths' , 39 , 'Male' , 'Gujranwala'),
(3 , 'Sufyan' , 'Maths' , 67 , 'Male' , 'Peshawar'),
(4 , 'Ali' , 'Maths' , 93 , 'Male' , 'Lahore'),
(5 , 'Zohaib' , 'Maths' , 69 , 'Male' , 'Okara'),
(6 , 'Ibtihaj' , 'Maths' , 55 , 'Male' , 'Gujranwala');

#Find student with highest scores.
select Max(subject_score)
from students;

#List all students who scored below 40.
select name , subject_score , std_id
from students
where subject_score < 40;

#Calculate average score of each student.
select  name , avg(subject_score)
from students
group by name;

#Display highest and lowest score
select  max(subject_score) , min(subject_score)
from students;

#Which city performs best on average?
select city , avg(subject_score) as avg_score
from students
group by city
order by avg_score desc
Limit 1;

#Students Scoring Between 50–70
select name , subject_score ,city
from students 
where subject_score between 50 and 70;

#Student with Highest Total Score
SELECT name, std_id, SUM(subject_score) AS total_score
FROM students
GROUP BY std_id, name
ORDER BY total_score DESC
LIMIT 1;