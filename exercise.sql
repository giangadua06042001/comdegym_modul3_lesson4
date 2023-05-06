CREATE DATABASE manager_student;
USE manager_student;
CREATE TABLE class(
IDcl INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
className VARCHAR (60) NOT NULL,
StastraDate DATETIME NOT NULL,
Status BIT
);
INSERT INTO class(IDcl, className,StastraDate,Status)
VALUES(1,'A1','2008-12-20',1);
INSERT INTO class(className,StastraDate,Status)
VALUES('A2','2008-12-22',1);
INSERT INTO class(IDcl,className,StastraDate,Status)
VALUES(3,'B1',current_date,0);
CREATE TABLE student(
studentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
studentName VARCHAR(60) NOT NULL,
Adess VARCHAR (60) ,
SDT VARCHAR(20),
Status BIT,
IDcl INT NOT NULL,
FOREIGN KEY (IDcl) REFERENCES class(IDcl));
INSERT INTO student(studentID,studentName,Adess,SDT,Status,IDcl)
VALUES(1,'Hung','Ha Noi',0964832435,1,1);
INSERT INTO student(studentID,studentName,Adess,SDT,Status,IDcl)
VALUES(2,'Anh','Phu Tho',09345156,1,2);
INSERT INTO student(studentID,studentName,Adess,SDT,Status,IDcl)
VALUES (3,'Dua','Lao Cai',0878541672,1,2);
INSERT INTO student(studentID,studentName,Adess,SDT,Status,IDcl)
VALUES(4,'chinh','Bac Kan',012232392,1,3);
CREATE TABLE subject(
subID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
subName VARCHAR(50) NOT NULL,
cridet INT NOT NULL,
status BIT  NOT NULL);
INSERT INTO subject(subID,subName,cridet,status)
VALUES(1,'Toan',1,1);
INSERT INTO subject(subID,subName,cridet,status)
VALUES(2,'Ngu Van',2,1);
INSERT INTO  subject(subID,subName,cridet,status)
VALUES(3,'Sinh hoc',7,1);
INSERT INTO subject(subName,cridet,status)
VALUES('Hoa',2,0);
CREATE TABLE mark(
markID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
subID INT NOT NULL,
studentID INT NOT NULL,
mark DOUBLE DEFAULT 5 CHECK(mark BETWEEN 0 AND 10),
Examtime INT NOT NULL,
FOREIGN KEY (subID) REFERENCES subject(subID),
FOREIGN KEY(studentID) REFERENCES student(studentID));
INSERT INTO mark(markID,subID,studentID,mark,Examtime)
VALUES(1,1,1,8,1);
INSERT INTO mark(subID,studentID,mark,Examtime)
VALUES(2,2,9,1);
INSERT INTO mark(subID,studentID,mark,Examtime)
VALUES(3,3,10,2);
INSERT INTO mark(subID ,studentID,Examtime)
VALUES(3,3,1);
SELECT Adess ,count(studentID) AS'noi o cua sinh vien'
FROM student
GROUP BY Adess;
SELECT student.studentID, student.studentName,AVG(mark)
FROM student JOIN mark ON student.studentID=mark.studentID
GROUP BY studentID,studentName
/*HAVING  AVG(mark)>8*/
HAVING AVR(mark)>=ALL(SELECT AVG(mark) FROM  mark GROUP BY mark.studentID);
SELECT subject.subName,subject.cridet, MAX(cridet) FROM subject
GROUP BY subName,cridet;
SELECT subject.subName,mark.mark,MAX(mark)FROM subject JOIN
mark ON subject.subID=mark.subID
GROUP BY subName,mark;
SELECT student.studentID,student.studentName,student.Adess,mark.mark ,
AVG(mark)
FROM student JOIN mark ON student.studentID=mark.studentID
GROUP BY studentID,studentName,Adess,mark
HAVING AVG(mark)>=ALL(SELECT AVG(mark) FROM mark ORDER BY AVG(mark) );





