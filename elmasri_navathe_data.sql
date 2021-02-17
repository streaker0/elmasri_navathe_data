PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS DEPT_LOCATIONS;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS WORKS_ON;
DROP TABLE IF EXISTS DEPENDENT;
CREATE TABLE EMPLOYEE ( Fname           TEXT NOT NULL,
  Minit           TEXT,
  Lname           TEXT NOT NULL,
  Ssn             TEXT PRIMARY KEY NOT NULL,
  Bdate           TEXT,
  Address         TEXT,
  Sex             TEXT,
  Salary          INT,
  Super_ssn       TEXT,
  Dno             INT NOT NULL
	);

CREATE TABLE DEPARTMENT ( Dname           TEXT NOT NULL,
  Dnumber         INT PRIMARY KEY NOT NULL,
  Mgr_ssn         TEXT NOT NULL,
  Mgr_start_date  TEXT
);

CREATE TABLE DEPT_LOCATIONS ( Dnumber         INT NOT NULL,
  Dlocation       TEXT NOT NULL,
  CONSTRAINT PK_Works_On PRIMARY KEY (Dnumber,Dlocation)
 );

CREATE TABLE PROJECT ( Pname           TEXT       NOT NULL,
  Pnumber         INT PRIMARY KEY NOT NULL,
  Plocation       TEXT,
  Dnum            INT               NOT NULL
 );

CREATE TABLE WORKS_ON ( Essn            TEXT NOT NULL,
  Pno             INT NOT NULL,
  Hours           DECIMAL(3,1)      NOT NULL,
  CONSTRAINT PK_Works_On PRIMARY KEY (Essn,Pno)
 );

CREATE TABLE DEPENDENT ( Essn            TEXT NOT NULL,
  Dependent_name  TEXT NOT NULL,
  Sex             TEXT,
  Bdate           TEXT,
  Relationship    TEXT,
  CONSTRAINT PK_Dependent PRIMARY KEY (Essn,Dependent_name)
 );

INSERT INTO EMPLOYEE
VALUES      ('John','B','Smith','123456789','9-Jan-55','731 Fondren','M',30000,'333445555',5),
            ('Franklin','T','Wong','333445555','8-Dec-45','638 Voss','M',40000,'888665555',5),
            ('Alicia','J','Zelaya','999887777','19-Jul-58','3321 Castle','F',25000,'987654321',4),
            ('Jennifer','S','Wallace','987654321','20-Jun-31','291 Berry','F',43000,'888665555',4),
            ('Ramesh','K','Narayan','666884444','15-Sep-52','975 Fire Oak','M',38000,'333445555',5),
            ('Joyce','A','English','453453453','31-Jul-62','5631 Rice','F',25000,'333445555',5),
            ('Ahmad','V','Jabbar','987987987','29-Mar-59','980 Dallas','M',25000,'987654321',4),
            ('James','E','Borg','888665555','10-Nov-27','450 Stone','M',55000,null,1);

INSERT INTO DEPARTMENT
VALUES      ('Research',5,'333445555','22-May-78'),
            ('Administration',4,'987654321','1-Jan-85'),
            ('Headquarters',1,'888665555','19-Jun-71');

INSERT INTO PROJECT
VALUES      ('ProductX',1,'Bellaire',5),
            ('ProductY',2,'Sugarland',5),
            ('ProductZ',3,'Houston',5),
            ('Computerization',10,'Stafford',4),
            ('Reorganization',20,'Houston',1),
            ('Newbenefits',30,'Stafford',4);

INSERT INTO WORKS_ON
VALUES     ('123456789',1,32.5),
           ('123456789',2,7.5),
           ('666884444',3,40.0),
           ('453453453',1,20.0),
           ('453453453',2,20.0),
           ('333445555',2,10.0),
           ('333445555',3,10.0),
           ('333445555',10,10.0),
           ('333445555',20,10.0),
           ('999887777',30,30.0),
           ('999887777',10,10.0),
           ('987987987',10,35.0),
           ('987987987',30,5.0),
           ('987654321',30,20.0),
           ('987654321',20,15.0),
           ('888665555',20,16.0);

INSERT INTO DEPENDENT
VALUES      ('333445555','Alice','F','5-Apr-76','Daughter'),
            ('333445555','Theodore','M','25-Oct-73','Son'),
            ('333445555','Joy','F','3-Mary-48','Spouse'),
            ('987654321','Abner','M','29-Feb-32','Spouse'),
            ('123456789','Michael','M','1-Jan-78','Son'),
            ('123456789','Alice','F','31-Jan-78','Daughter'),
            ('123456789','Elizabeth','F','5-May-57','Spouse');

INSERT INTO DEPT_LOCATIONS
VALUES      (1,'Houston'),
            (4,'Stafford'),
            (5,'Bellaire'),
            (5,'Sugarland'),
            (5,'Houston');
COMMIT;