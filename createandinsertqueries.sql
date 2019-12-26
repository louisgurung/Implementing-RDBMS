CREATE TABLE ROLES(
	Role_Id INT IDENTITY,
	Role_Name VARCHAR(20)

	PRIMARY KEY(Role_Id),
);

CREATE TABLE EMPLOYEE(
	Employee_Id INT IDENTITY,
	FirstName VARCHAR(20),
	MiddleName VARCHAR(15),
	LastName VARCHAR(20),
	Age INT,
	Gender VARCHAR(10),
	[Address] VARCHAR(50),
	Phone_Number VARCHAR(20),
	Joined_on DATE,
	Email VARCHAR(30),
	Role_Id INT,
	Salary BIGINT

	PRIMARY KEY(Employee_Id),
	FOREIGN KEY(Role_Id) REFERENCES ROLES(Role_Id),

	CONSTRAINT ck_gndr CHECK (GENDER in ('Male','Female'))
);

CREATE TABLE SUPERVISOR(
    Employee_Id INT NOT NULL,
	Supervisor_Id INT,

	PRIMARY KEY(Employee_Id),
	FOREIGN KEY(Employee_Id) REFERENCES EMPLOYEE(Employee_Id),
	FOREIGN KEY(Supervisor_Id) REFERENCES EMPLOYEE(Employee_Id)
);

CREATE TABLE DEPENDENT(
	D_Id INT IDENTITY,
	FirstName VARCHAR(20),
	MiddleName VARCHAR(15),
	LastName VARCHAR(20),
	[Address] VARCHAR(50),
	Phone_Number VARCHAR(20),
	Email VARCHAR(30),
	Relationship VARCHAR(15),
	Employee_Id INT

	PRIMARY KEY(D_Id),
	FOREIGN KEY(Employee_Id) REFERENCES EMPLOYEE(Employee_Id)
);

CREATE TABLE PAYMENTTOEMPLOYEES(
	Payment_Id INT IDENTITY,
	Employee_Id INT,
	PayPeriod_Startdate DATE,
	PayPeriod_Enddate DATE,
	Amount INT,
	[Status] VARCHAR(15)

	PRIMARY KEY(Payment_Id),
	FOREIGN KEY(Employee_Id) REFERENCES EMPLOYEE(Employee_Id)
);

CREATE TABLE BANKINFO(
	Employee_Id INT NOT NULL,
	BankName VARCHAR(35),
	BankAccountNumber VARCHAR(35)

	PRIMARY KEY(Employee_Id)
	FOREIGN KEY(Employee_Id) REFERENCES EMPLOYEE(Employee_Id)
);

CREATE TABLE PROJECT(
	Project_Id INT NOT NULL,
	Project_Name VARCHAR(25),
	Client_Id INT,
	Date_Started DATE,
	Date_Completed DATE,
	Budget BIGINT

	PRIMARY KEY(Project_Id)
);

CREATE TABLE CLIENT(
	Client_Id INT NOT NULL,
	FirstName VARCHAR(20),
	MiddleName VARCHAR(15),
	LastName VARCHAR(20),
	[Address] VARCHAR(50),
	Phone_Number VARCHAR(20),
	Email VARCHAR(35),
	Project_Id INT

	PRIMARY KEY(Client_Id) 
	FOREIGN KEY(Project_Id) REFERENCES PROJECT(Project_Id)

);

CREATE TABLE PAYMENTFROMCLIENT(
	Payment_Id INT NOT NULL,
	Client_Id INT,
	Project_Id INT,
	Total_Budget BIGINT,
	Amount_Paid BIGINT,
	Amount_Remaining BIGINT

	PRIMARY KEY(Payment_Id)
	FOREIGN KEY(Client_Id) REFERENCES CLIENT(Client_Id),
	FOREIGN KEY(Project_Id) REFERENCES PROJECT(Project_Id)
);


CREATE TABLE EMPLOYEE_PROJECT(
	Id INT IDENTITY,
	Employee_Id INT,
	Project_Id INT,
	[Start_Date] DATE,
	[End_Date] DATE 

	PRIMARY KEY(Id)
	FOREIGN KEY(Employee_Id) REFERENCES EMPLOYEE(Employee_Id),
	FOREIGN KEY(Project_Id) REFERENCES PROJECT(Project_Id)
);

INSERT INTO ROLES(Role_Name) VALUES ('Developer');
INSERT INTO ROLES(Role_Name) VALUES ('System analyst');
INSERT INTO ROLES(Role_Name) VALUES ('Business analyst');
INSERT INTO ROLES(Role_Name) VALUES ('Architect');
INSERT INTO ROLES(Role_Name) VALUES ('Network engineer');
INSERT INTO ROLES(Role_Name) VALUES ('Tester');
INSERT INTO ROLES(Role_Name) VALUES ('Manager');




INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Bernadette','Rae','Dwyer','25','Female','830 Foxrun Dr. Lake Charles, LA 70602','Bernadette_Dw@kideod.biz','(643) 955-3849','1/15/2001','100000','4');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Clarissa ','','Hope','27','Female','87 Pine Ave. Campti, LA 71411','Clarissa_Hope910@eirey.tech','(353) 348-9758','4/4/2001','70000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Logan ','Arthur','Barrett','35','Male','5 Surrey Lane Leonville, LA 70551','Logan_Barrett567@guentu.biz','(822) 683-4459','5/7/2002','60000','5');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Naomi ','','Blythe','43','Female','494 West Lilac Dr. Ida, LA 71044','Naomi_Blythe6008@grannar.com','(242) 854-5788','1/9/2003','56000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Daria','','Knight','35','Female','3 Cobblestone Drive Barksdale Afb, LA 71110','Daria_Knight6680@gembat.biz','(576) 997-7029','4/28/2003','120000','2');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Liam ','','Logan','45','Male','6 Cross Rd. Reserve, LA 70084','Liam_Logan1597@gmail.com','(749) 456-3661','6/23/2003','75000','3');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Anne ','Lane','Wren','53','Female',' 621 Butcher Road Baldwin, LA 70514','Anne_Wren454@grannar.com','(928) 311-4725','11/26/2003','62000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Nancy ','','Baker','35','Female','701 Iroquois St. Clarks, LA 71415','Nancy_Baker3243@ubusive.com','(860) 288-3275','2/10/2004','57000','2');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Daniel ','','Lunt','36','Male',' 264 Flint St. New Orleans, LA 70145','Daniel_Lunt5912@sheye.org','(661) 878-0716','10/29/2004','70000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Roger ','Michael','Tindall','24','Male','7977 South Sleepy Hollow St. Houma, LA 70360','Roger_Tindall1291@liret.org','(787) 561-8300','10/14/2005','63000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Erica ','','Henderson','40','Female',' 62 Beech Street Sicily Island, LA 71368','Erica_Henderson371@eirey.tech','(343) 309-6141','9/5/2006','250000','3');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Ada ','','Victor','43','Female','138 Bliss Road Paincourtville, LA 70391','Ada_Victor6760@twipet.com','(490) 202-7657','6/22/2007','130000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Hank ','','Ross','45','Male','5 Fieldstone Street Gorum, LA 71434','Hank_Ross319@gembat.biz','(935) 730-4662','1/25/2011','150000','6');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('David','','Murphy','47','Male','16 Beach Avenue Alexandria, LA 71301','David_Murphy4506@gompie.com','(711) 529-5849','12/22/2011','90000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Christy ','','Bennett','50','Female','11 Lyme Ave. Cottonport, LA 71327','Christy_Bennett6482@i44.tech','(326) 507-2290','2/5/2013','80000','5');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Danny ','','Cowan','51','Male','8187 Charles St. Schriever, LA 70395','Danny_Cowan8518@deons.tech','(963) 704-7948','2/12/2014','75000','4');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Rosalie ','Aria','Trent','26','Female','38 Corporation Dr. Wildsville, LA 71377','Rosalie_Trent8274@ubusive.com','(371) 233-8061','8/5/2016','70000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Daphne ','','Eddison','28','Female','307 Smith Dr. Choudrant, LA 71227','Daphne_Eddison8074@guentu.biz','(762) 759-0159','5/17/2018','820000','1');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Tony ','','Gordon','34','Male','949 Underwood Rd. Pelican, LA 71063','Tony_Gordon7259@twipet.com','(277) 242-2288','6/1/2018','74000','6');
INSERT INTO Employee (FirstName,MiddleName,LastName,Age, Gender,Address,Email,Phone_Number,Joined_On,Salary,Role_Id) VALUES ('Bethany','Ivy','Tanner','42','Female','7859 Hilltop Road Violet, LA 70092','Bethany_Tanner4409@bretoux.com','(355) 750-9549','9/4/2018','79000','1');






INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('1','5');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('2','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('3','15');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('4','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('5','15');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('6','15');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('7','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('8','15');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('9','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('10','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('11','5');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('12','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('13','5');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('14','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('15','15');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('16','5');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('17','15');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('18','17');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('19','5');
INSERT INTO SUPERVISOR (Employee_id,Supervisor_Id) VALUES ('20','17');



INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Jack','','Barrett','3 Rosewood Dr. Astoria, NY 11102','(410) 874-5578','j.smith@randatmail.com','father','3');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Charlie','Damon','Barrett','8488 Leatherwood St.Griffin, GA 30223','(931) 790-5556','c.russell@randatmail.com','brother','3');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Abraham','','Logan','593 W. Queen Drive Geneva, IL 60134','(338) 306-4446','a.morris@randatmail.com','father','6');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Antony','','Logan','39 Howard St. Suite 96 Mobile, AL 36605','(997) 302-9133','a.farrell@randatmail.com','grandfather','6');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Evelyn','Alice','Baker','882 Sierra Lane Pembroke Pines, FL 33028','(763) 558-9646','e.owens@randatmail.com','mother','8');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Deanna','','Russell','9968 University Street Lebanon, PA 17042','(977) 805-6175','d.russell@randatmail.com','wife','9');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Ellia','Jacklyn','Henderson','502 Chapel Ave. Attleboro, MA 02703','(801) 940-7000','e.martin@randatmail.com','sister','11');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Brad','','Murphy','316 Washington Drive Evanston, IL 60201','(235) 380-2032','b.montgomery@randatmail.com','father','14');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Caroline','','Morrison','254 Cleveland Court Nicholasville, KY 40356','(934) 674-4065','c.morrison@randatmail.com','wife','14');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Maximilian','David','Murphy','Nottingham, MD 21236 ','(448) 979-6006','m.hamilton@randatmail.com','son','14');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Lilianna','','Cowan','14 Griffin St. Oak Creek, WI 53154','(754) 485-2106','l.howard@randatmail.com','sister','16');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Cherry','Aria','Trent','83 Atlantic St. Elkridge, MD 21075','(263) 404-8305','c.moore@randatmail.com','grandmother','17');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Andrew','','Higgins','13 Poplar Drive Chesterfield, VA 23832','(799) 307-2330','a.higgins@randatmail.com','husband','18');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Frederick','','Gordon','7917 Wayne St. Salisbury, MD 21801','(797) 475-5046','f.mason@randatmail.com','father','19');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Robert','Michael','Gordon','8941 Pilgrim Lane Hartford, CT 06106','(419) 722-1468','r.adams@randatmail.com','son','19');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Tess','','Richardson','679 Logan Rd. Belleville, NJ 07109','(798) 363-4242','t.richardson@randatmail.com','husband','20');
INSERT INTO DEPENDENT (FirstName,MiddleName,LastName,Address,Phone_Number,Email,Relationship,Employee_Id) VALUES ('Grace','Arden','Richardson','7963 Glendale Ave. Minneapolis, MN 55406','(966) 773-2956','g.bailey@randatmail.com','daughter','20');


INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('1','10/13/2019','10/27/2019','2200 ','paid');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('5','10/13/2019','10/27/2019','2000 ','paid');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('6','10/13/2019','10/27/2019','2500 ','paid');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('13','10/13/2019','10/27/2019','3200 ','paid');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('1','10/27/2019','11/10/2019','1500 ','paid');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('2','10/27/2019','11/10/2019','1750 ','pending');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('4','10/27/2019','11/10/2019','2000 ','paid');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('15','10/27/2019','11/10/2019','1250 ','pending');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('17','10/27/2019','11/10/2019','1000 ','pending');
INSERT INTO PAYMENTTOEMPLOYEES (Employee_Id,PayPeriod_Startdate,PayPeriod_Enddate,Amount,Status) VALUES ('13','10/27/2019','11/10/2019','2100 ','paid');


INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('1','Marshall Banks Inc.','4026737888207810');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('2','Elysium Bank','3568356930981450');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('3','Excellence Bank Corp.','3572971971509530');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('4','Polestar Bancorp','4917662719328270');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('5','Obsidian Financial Group','3581604176826020');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('6','Citizen Service Credit Union','3577472501455800');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('7','New Civil Financial','5602240039474470000');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('8','City Ward Holding Company','374283853575538');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('9','Ace Trust','3532906016306010');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('10','Soul Bancshares','493647163475085000');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('11','City Ward Holding Company','3577549483590270');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('12','Polestar Bancorp','6379325596727730');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('13','Polestar Bancorp','5100130122572230');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('14','Polestar Bancorp','630440437648282000');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('15','Citizen Service Credit Union','30480855640775');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('16','New Civil Financial','3578289566964070');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('17','Citizen Service Credit Union','6387130100916430');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('18','Citizen Service Credit Union','3581556363316570');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('19','Elysium Bank','30072901107188');
INSERT INTO BANKINFO (Employee_Id,BankName,BankAccountNumber) VALUES ('20','New Civil Financial','3547217175085730');





INSERT INTO Project (Project_Id,Client_Id,Project_Name,Date_Started,Date_Completed,Budget) VALUES ('111','102','PROJECT YARRA','5/30/2006','6/22/2013','175000');
INSERT INTO Project (Project_Id,Client_Id,Project_Name,Date_Started,Date_Completed,Budget) VALUES ('112','101','PROJECT DB','7/3/2016','4/4/2017','70000');
INSERT INTO Project (Project_Id,Client_Id,Project_Name,Date_Started,Date_Completed,Budget) VALUES ('113','104','PROJECT COSMO','7/12/2013','8/12/2015','25000');
INSERT INTO Project (Project_Id,Client_Id,Project_Name,Date_Started,Date_Completed,Budget) VALUES ('114','103','PROJECT ARIZONA','2/17/2019','5/29/2019','22500');
INSERT INTO Project (Project_Id,Client_Id,Project_Name,Date_Started,Date_Completed,Budget) VALUES ('115','105','PROJECT L2','3/6/2014','5/10/2019','250000');



INSERT INTO Client (Client_Id,FirstName,MiddleName,LastName,Address,Phone_Number,Email,Project_Id) VALUES ('101','Aanya ','Kay','Best','Hickory Hill Rd, Fonda, NY, 12068','(457) 400-7426','aanyakaybest123@gmail.com','112');
INSERT INTO Client (Client_Id,FirstName,MiddleName,LastName,Address,Phone_Number,Email,Project_Id) VALUES ('102','Solomon ','','Santiago','103 Reed St, Crawford, NE, 69339','(829) 315-7731','santiagosolomon31@hotmail.com','111');
INSERT INTO Client (Client_Id,FirstName,MiddleName,LastName,Address,Phone_Number,Email,Project_Id) VALUES ('103','Lily ','','Shields','130 Homecroft Ct, Superior, WI, 54880','(729) 293-5531','lilyshields444@gmail.com','114');
INSERT INTO Client (Client_Id,FirstName,MiddleName,LastName,Address,Phone_Number,Email,Project_Id) VALUES ('104','Imani ','Ivy','Arroyo','81 Almond Dr, Somerset, NJ, 08873','(445) 350-2321','ivyimaniarroyo13@gmail.com','113');
INSERT INTO Client (Client_Id,FirstName,MiddleName,LastName,Address,Phone_Number,Email,Project_Id) VALUES ('105','Osman ','Arthur','Frank','701 Caroline Ave, Mount Shasta, CA, 96067 ','(517) 914-3518','frankarthur782@yahoo.com','115');



INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('1','104','113','25000','10000','15000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('2','101','112','70000','50000','20000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('3','105','115','250000','150000','100000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('4','104','113','25000','15000','10000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('5','103','114','22500','20000','2500');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('6','102','111','175000','100000','75000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('7','101','112','70000','20000','50000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('8','103','114','22500','2500','20000');
INSERT INTO PAYMENTFROMCLIENT (Payment_Id,Client_Id,Project_Id,Total_Budget,Amount_Paid,Amount_Remaining) VALUES ('9','105','115','250000','50000','200000');



INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('1','111','9/28/2007','9/21/2010');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('4','111','2/6/2008','5/17/2010');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('7','111','12/18/2008','10/6/2011');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('9','111','5/17/2010','2/12/2012');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('2','111','10/6/2011','12/6/2013');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('3','111','12/7/2010','12/5/2011');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('18','111','5/9/2013','6/22/2013');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('10','112','7/20/2016','12/20/2016');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('12','112','8/9/2016','1/20/2017');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('9','112','10/31/2016','3/2/2017');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('15','112','11/18/2016','4/4/2017');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('18','113','7/12/2013','12/12/2014');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('20','113','12/11/2014','8/12/2015');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('1','114','3/2/2019','5/2/2019');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('18','114','2/17/2019','5/1/2019');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('20','114','2/23/2019','4/23/2019');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('8','114','2/25/2019','5/29/2019');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('9','115','3/6/2014','5/6/2017');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('10','115','4/3/2015','5/1/2019');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('3','115','3/12/2016','5/10/2019');
INSERT INTO EMPLOYEE_PROJECT (Employee_Id,Project_Id,Start_Date,End_Date) VALUES ('5','115','5/22/2017','6/28/2019');
