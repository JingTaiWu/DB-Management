--Jing Tai Wu
--Normalizton 3

--Create All the Tables
CREATE TABLE Person(
	pid		char(4) not null,
	FirstName	text,
	LastName	text,
	Age		int,
	PreferredDrinks	text,
	Hobby		text,

	primary key(pid)
	
);

CREATE TABLE Jobs(
	jid		char(4) not null,
	JobName		text,
	JobDescr	text,
	YearsExp	int,

	primary key(jid)
);

CREATE TABLE Roles(
	pid		char(4) not null references Person(pid),
	jid		char(4) not null references Jobs(jid),

	primary key(pid, jid)

);

CREATE TABLE Spacecraft(
	sid		char(4) not null,
	SpcrftName	text,
	TailNum		int,
	WegtinTons	int,
	FuelType	text,
	CrwCpacty	int,

	primary key(sid)
);


CREATE TABLE Crew(
	pid		char(4) not null,
	jid		char(4) not null,
	sid		char(4) not null references Spacecraft(sid),

	foreign key(pid, jid) references Roles(pid,jid),
	primary key(pid, jid, sid)
);

CREATE TABLE Systems(
	sid		char(4) not null references Spacecraft(sid),
	SysNme		text not null,
	Dscrp		text,

	primary key(sid, sysNme)
);

CREATE TABLE Parts(
	sid		char(4) not null,
	SysNme		text not null,
	PrtNme		text not null,
	Dscrp		text,

	foreign key(sid, SysNme) references Systems(sid, SysNme),
	primary key(sid, SysNme, PrtNme)
);

CREATE TABLE Suppliers(
	supId		char(4) not null,
	supNme		text,
	Address		text,
	PymtTrm		text,

	primary key(supId)
);

CREATE TABLE Catalogs(
	sid		char(4) not null,
	SysNme		text not null,
	PrtNme		text not null,
	supId		char(4) not null references Suppliers(supId),

	foreign key(sid, SysNme, PrtNme) references Parts(sid, SysNme, PrtNme),
	primary key(sid, SysNme, PrtNme, supId)
);

--Insert some Test data
insert into Person(pid, FirstName, LastName, Age, PreferredDrinks, Hobby)
	values('a007', 'James', 'Bond', 40, 'Beer', 'Movies');

insert into Jobs(jid, JobName, JobDescr, YearsExp)
	values('j001', 'The God of Astronauts', 'Mr.Knows-it-all', 30);

insert into Roles(pid, jid)
	values('a007', 'j001');

insert into Spacecraft(sid,SpcrftName,TailNum,WegtinTons,FuelType,CrwCpacty)
	values('s001', '007Craft', 50, 50000, 'Magic Fuel', 1);

insert into Crew(pid, jid, sid)
	values('a007', 'j001', 's001');

insert into Systems(sid, SysNme, Dscrp)
	values('s001', 'James the God Control System', 'Never crashes, extremely reliable');

insert into Parts(sid, SysNme, PrtNme, Dscrp)
	values('s001', 'James the God Control System', 'The Source', 'Yall need something to power that ish');

insert into Suppliers(supId,supNme,Address,PymtTrm)
	values('sp01', 'China', 'Earth', 'One time');

insert into Catalogs(sid, SysNme, PrtNme, supId)
	values('s001', 'James the God Control System', 'The Source', 'sp01');

--select and see
select * from Person
select * from Jobs
select * from Roles
select * from Spacecraft
select * from Crew
select * from Systems
select * from Parts
select * from Suppliers
select * from Catalogs