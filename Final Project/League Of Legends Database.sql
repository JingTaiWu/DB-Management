CREATE TABLE Account(
	aid		char(7) not null,
	FirstName	text,
	LastName	text,
	DoB		date,
	Email		text,

	primary key(aid)
);

CREATE TABLE IPAmt(
	aid		char(7) not null references Account(aid),
	GameDate	timestamp,
	IPErned		integer,

	primary key(aid, GameDate)
);

CREATE TABLE RPAmt(
	aid		char(7) not null references Account(aid),
	Date		timestamp,
	CrdCd		text,
	Amt		integer,

	primary key(aid, Date, CrdCd, Amt)
);

CREATE TABLE Champions(
	cid		char(7) not null,
	Name		text,
	RPCost		integer,
	IPCost		integer,

	primary key(cid)		
);

CREATE TABLE ChmpTrans(
	aid		char(7) not null references Account(aid),
	cid		char(7) not null references Champions(cid),
	PymtMthd	text,

	primary key(aid, cid)		
);

CREATE TABLE Skins(
	sid		char(7) not null,
	Name		text not null unique,
	RPCost		integer,

	primary key(sid)
);


CREATE TABLE ChampWithSkins(
	cid		char(7) not null references Champions(cid),
	sid		char(7) not null references Skins(sid),

	primary key(cid, sid)	
);

CREATE TABLE SkinTrans(
	aid		char(7) not null references Account(aid),
	sid		char(7) not null references Skins(sid),

	primary key(aid, sid)
);

CREATE TABLE SummonerIcons(
	iconid		char(7) not null,
	Name		text,
	RPCost		integer,

	primary key(iconid)
);

CREATE TABLE IconTrans(
	iconid		char(7) not null references SummonerIcons(iconid),
	aid		char(7) not null references Account(aid),

	primary key(iconid, aid)
);

CREATE TABLE WardSkins(
	wid		char(7) not null,
	Name		text,
	RPCost		integer,

	primary key(wid)
);

CREATE TABLE WardTrans(
	wid		char(7) not null references WardSkins(wid),
	aid		char(7) not null references Account(aid),

	primary key(wid, aid)
);

--insert statement
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a001','Jing Tai', 'Wu', '03/23/1993','jingthebest@gmail.com');
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a002','Alan', 'Labouseur', '03/23/1800','YI-ER-SAN@gmail.com');
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a003','Brian', 'Dones', '09/18/1993','ILoveShakira@gmail.com');
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a004','Matt', 'Ancona', '02/19/1992','AccountingSucks@gmail.com');
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a005','Robert', 'Paquini', '03/23/1990','AmericanWannabe@gmail.com');
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a006','Matthew', 'Johnson', '07/23/1700','TheIndianChief@gmail.com');
insert into Account(aid,FirstName,LastName,DoB,Email) 
	     values('a007','James', 'Bond', '08/25/1930','StrongerThanChuckNorris@gmail.com');

insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a001','2014-04-24 12:12:12', 'American Express', 1000);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a002','2014-04-10 12:12:12', 'VISA', 2000);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a003','2014-04-12 12:12:12', 'MasterCard', 3000);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a004','2014-01-24 12:12:12', 'VISA GiftCard', 500);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a005','2014-03-24 12:12:12', 'Discover', 800);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a006','2013-02-24 12:12:12', 'Captial One', 6000);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a007','2014-04-22 12:12:12', 'Citi Bank', 1000);
insert into RPAmt(aid,Date,CrdCd,Amt) 
	     values('a001','2014-04-23 12:12:12', 'American Express', 3000);

insert into IPAmt(aid,GameDate,IPErned) 
	    values('a001', '2013-03-24 11:11:11', 90);
insert into IPAmt(aid,GameDate,IPErned) 
	    values('a002', '2013-03-24 11:11:11', 80);
insert into IPAmt(aid,GameDate,IPErned) 
	    values('a003', '2013-03-24 11:11:11', 40);
insert into IPAmt(aid,GameDate,IPErned) 
	    values('a004', '2013-03-24 11:11:11', 60);
insert into IPAmt(aid,GameDate,IPErned) 
	    values('a005', '2013-03-24 11:11:11', 30);
insert into IPAmt(aid,GameDate,IPErned) 
	    values('a006', '2013-03-24 11:11:11', 60);
insert into IPAmt(aid,GameDate,IPErned) 
	    values('a007', '2013-03-24 11:11:11', 40);

insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c001','Aatrox','975','6300');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c002','Ahri','975','6300');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c003','Akali','480','3150');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c004','Alistar','260','450');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c005','Amumu','480','3150');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c006','Anivia','480','3150');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c007','Annie','260','450');
insert into Champions(cid,Name,RPCost,IPCost) 
	    values('c008','Ashe','260','450');

insert into ChmpTrans(aid,cid,PymtMthd)
            values('a001','c001','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a002','c002','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a003','c001','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a004','c003','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a005','c003','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a006','c004','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a007','c007','RP');
insert into ChmpTrans(aid,cid,PymtMthd)
            values('a002','c008','RP');

insert into Skins(sid,Name,RPCost)
	    values('s001','Justicar Aatrox', 975);
insert into Skins(sid,Name,RPCost)
	    values('s002','Dynasty Ahri', 975);
insert into Skins(sid,Name,RPCost)
	    values('s003','Blood Moon Akali', 975);
insert into Skins(sid,Name,RPCost)
	    values('s004','Nurse Akali', 975);
insert into Skins(sid,Name,RPCost)
	    values('s005','Infernal Alistar', 975);
insert into Skins(sid,Name,RPCost)
	    values('s006','LongHorn', 520);
insert into Skins(sid,Name,RPCost)
	    values('s007','Golden Alistar', 390);
insert into Skins(sid,Name,RPCost)
	    values('s008','Sad Robot Amumu', 1350);
insert into Skins(sid,Name,RPCost)
	    values('s009','Emumu', 520);

insert into ChampWithSkins(cid, sid)
		values('c001','s001');
insert into ChampWithSkins(cid, sid)
		values('c002','s002');
insert into ChampWithSkins(cid, sid)
		values('c003','s003');
insert into ChampWithSkins(cid, sid)
		values('c003','s004');
insert into ChampWithSkins(cid, sid)
		values('c004','s005');
insert into ChampWithSkins(cid, sid)
		values('c004','s006');
insert into ChampWithSkins(cid, sid)
		values('c004','s007');
insert into ChampWithSkins(cid, sid)
		values('c005','s008');
insert into ChampWithSkins(cid, sid)
		values('c005','s009');

insert into SkinTrans(aid, sid)
		values('a001','s001');
insert into SkinTrans(aid, sid)
		values('a001','s002');
insert into SkinTrans(aid, sid)
		values('a002','s007');
insert into SkinTrans(aid, sid)
		values('a002','s004');
insert into SkinTrans(aid, sid)
		values('a003','s002');
insert into SkinTrans(aid, sid)
		values('a003','s003');
insert into SkinTrans(aid, sid)
		values('a004','s004');
insert into SkinTrans(aid, sid)
		values('a005','s005');
insert into SkinTrans(aid, sid)
		values('a006','s007');

insert into SummonerIcons(iconid, Name, RPCost)
		values('cn001', 'CLG', 260);
insert into SummonerIcons(iconid, Name, RPCost)
		values('cn002', 'TSM', 260);
insert into SummonerIcons(iconid, Name, RPCost)
		values('cn003', 'DNG', 260);
insert into SummonerIcons(iconid, Name, RPCost)
		values('cn004', 'WE', 260);
insert into SummonerIcons(iconid, Name, RPCost)
		values('cn005', 'SK1', 260);
insert into SummonerIcons(iconid, Name, RPCost)
		values('cn006', 'OMG', 260);
insert into SummonerIcons(iconid, Name, RPCost)
		values('cn007', 'LGD', 260);

insert into IconTrans(iconid, aid)
		values('cn001','a001');
insert into IconTrans(iconid, aid)
		values('cn002','a001');
insert into IconTrans(iconid, aid)
		values('cn003','a001');
insert into IconTrans(iconid, aid)
		values('cn004','a001');
insert into IconTrans(iconid, aid)
		values('cn005','a001');
insert into IconTrans(iconid, aid)
		values('cn006','a001');
insert into IconTrans(iconid, aid)
		values('cn001','a002');
insert into IconTrans(iconid, aid)
		values('cn001','a003');

insert into WardSkins(wid, Name, RPCost)
		values('w001','Season 3 Victorious Ward', 640);
insert into WardSkins(wid, Name, RPCost)
		values('w002','Starcall Ward', 640);
insert into WardSkins(wid, Name, RPCost)
		values('w003','Luminosity Ward', 640);
insert into WardSkins(wid, Name, RPCost)
		values('w004','Ward of Draven', 640);

insert into WardTrans(wid, aid)
		values('w001','a001');
insert into WardTrans(wid, aid)
		values('w002','a002');
insert into WardTrans(wid, aid)
		values('w003','a005');
insert into WardTrans(wid, aid)
		values('w004','a004');
insert into WardTrans(wid, aid)
		values('w002','a003');

--Create views
create view RPIncome
as
select r.Date as "Date Purchased", r.Amt as "RP Purchased", a.FirstName, a.LastName
from Account a, RPAmt r
where a.aid = r.aid

create view ChampRec
as
select a.FirstName, a.LastName, c.Name as "Champion Name"
from Account a, Champions c, ChmpTrans ct
where a.aid = ct.aid
and   c.cid = ct.cid

--Queries
select a.FirstName, a.LastName, sum(r.Amt) as "Total RP"
from Account a, RPAmt r
where a.aid = r.aid
group by a.FirstName, a.LastName

select a.FirstName, a.LastName, sum(i.IPErned) as "Total IP"
from Account a, IPAmt i
where a.aid = i.aid
group by a.FirstName, a.LastName

--Stored Procedures
--isSkinFor
create or replace function isSkinFor (text, refcursor) returns refcursor as
$$
declare
	SkinName text := $1;
	resultset refcursor := $2;
begin
	open resultset for
		select Champions.Name as "Champion", Skins.Name as "Skin name", Skins.RPCost
		from Champions, Skins, ChampWithSkins
		where Champions.cid = ChampWithSkins.cid
		and   Skins.sid = ChampWithSkins.sid
		and   Skins.Name = SkinName;
	return resultset;
end;
$$
language plpgsql;

select isSkinFor('Emumu','results');
Fetch all from results;

--hasSkin
create or replace function isSkinFor (text, refcursor) returns refcursor as
$$
declare
	ChampName text := $1;
	resultset refcursor := $2;
begin
	open resultset for
		select Champions.Name as "Champion", Skins.Name as "Skin name", Skins.RPCost
		from Champions, Skins, ChampWithSkins
		where Champions.cid = ChampWithSkins.cid
		and   Skins.sid = ChampWithSkins.sid
		and   Champions.Name = ChampName;
	return resultset;
end;
$$
language plpgsql;

select isSkinFor('Akali','results');
Fetch all from results;

--Security
CREATE ROLE admin;
GRANT select, insert, update
on all tables in schema public
to admin

CREATE ROLE normal_user
grant update
on Account to normal_user

CREATE ROLE salesman
grant insert, update
on ChmpTrans,IconTrans,WardTrans,SkinTrans to salesman