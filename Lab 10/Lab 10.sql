--Jing Tai Wu
--Last Lab

--function PreReqsfor
create or replace function PreReqsFor(integer, REFCURSOR) returns REFCURSOR as
$$
declare
	courseNum_Req integer := $1;
	resultset   REFCURSOR := $2;
begin
	open resultset for
		select preReqNum
		from Prerequisites
		where courseNum = courseNum_Req;
	return resultset;
end;
$$
language plpgsql; 

--test it out
select PreReqsFor(499, 'results');
Fetch all from results;

--Functions IsPReReqsFor
create or replace function IsPreReqFor(integer, refcursor) returns refcursor as
$$
declare
	preReq	integer := $1;
	resultset refcursor := $2;
begin
	open resultset for
		select courseNum
		from Prerequisites
		where preReqNum = preReq;
	return resultset;
end;
$$
language plpgsql;

--test it out
select IsPreReqFor(120, 'result');
Fetch all from result;