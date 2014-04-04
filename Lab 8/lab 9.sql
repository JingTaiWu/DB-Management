DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS directosInMovies;
DROP TABLE IF EXISTS actorsInMovies;

CREATE TABLE person (
	pid		char(4) not null,
	firstName 	text,
	lastName	text,
	birthdate	date,
	hairColor	text,
	eyeColor	text,
	heightInches	int,
	weightlbs	int,
	city		text,
	state		text,

	primary key(pid)
);

CREATE TABLE movies (
	mid			char(4) not null,
	movieName		text,
	yearReleased		int,
	domesticSalesUSD	decimal(15,2),
	foreignSalesUSD		decimal(15,2),
	DVDSalesUSD		decimal(15,2),

	primary key (mid)
);

CREATE TABLE actors (
	pid		char(4) not null references person(pid),
	screenDate	date,

	primary key (pid)
);

CREATE TABLE directors (
	pid		char(4) not null references person(pid),
	filmSchool	text,
	guildAvsryDate	date,

	primary key (pid)
);

--director in different movies--
CREATE TABLE directorsInMovies (
	pid			char(4) not null references person(pid),
	mid			char(4) not null references movies(mid),
	directorSalaryUSD	decimal(15,2),

	primary key(pid, mid)
	
);

--Actors in different movies--
CREATE TABLE actorsInMovies (
	pid			char(4) not null references person(pid),
	mid			char(4) not null references movies(mid),
	actorSalaryUSD		decimal(15,2),

	primary key(pid, mid)
);

--INSERTIONS --
INSERT INTO person (pid, firstName, lastName, birthdate, hairColor, eyeColor, heightInches, weightlbs, city, state)
	VALUES ('a007', 'Sean', 'Connery', '1930-08-25', 'white', 'black', 74, 201, 'FountainBridge', 'Edinburgh');

INSERT INTO person (pid, firstName, lastName, birthdate, hairColor, eyeColor, heightInches, weightlbs, city, state)
	VALUES ('a001', 'Terence', 'Young', '1915-06-20', 'black', 'black', 76, 220, 'Shanghai', 'China');

INSERT INTO person (pid, firstName, lastName, birthdate, hairColor, eyeColor, heightInches, weightlbs, city, state)
	VALUES ('a002', 'Jet', 'Li', '1963-04-26', 'black', 'black', 66, 180, 'Beijing', 'China');

INSERT INTO person (pid, firstName, lastName, birthdate, hairColor, eyeColor, heightInches, weightlbs, city, state)
	VALUES ('a003', 'Jackie', 'Chan', '1954-04-7', 'black', 'black', 69, 194, 'HongKong', 'China');

INSERT INTO movies (mid, movieName, yearReleased, domesticSalesUSD, foreignSalesUSD, DVDSalesUSD)
	VALUES ('m001', 'From Russia with Love', 1963, 1000000.00, 1000000.00, 1000000.00);
	
INSERT INTO movies (mid, movieName, yearReleased, domesticSalesUSD, foreignSalesUSD, DVDSalesUSD)
	VALUES ('m002', 'Rush Hour', 1998, 1000000.00, 1000000.00, 1000000.00);

INSERT INTO movies (mid, movieName, yearReleased, domesticSalesUSD, foreignSalesUSD, DVDSalesUSD)
	VALUES ('m003', 'Rush Hour II', 2001, 1000200.00, 1000200.00, 1000200.00);

INSERT INTO movies (mid, movieName, yearReleased, domesticSalesUSD, foreignSalesUSD, DVDSalesUSD)
	VALUES ('m004', 'The Forbidden Kingdom', 2005, 10003000.00, 10040000.00, 10005000.00);

INSERT INTO directorsInMovies (pid, mid, directorSalaryUSD)
	VALUES ('a001', 'm001', 100000.00);

INSERT INTO directorsInMovies (pid, mid, directorSalaryUSD)
	VALUES ('a002', 'm004', 102000.00);

INSERT INTO actorsInMovies (pid, mid, actorSalaryUSD)
	VALUES ('a007', 'm001', 100000.00);

INSERT INTO actors(pid, screenDate)
	VALUES ('a007', '1950-04-20');

INSERT INTO actors(pid, screenDate)
	VALUES ('a002', '1999-05-21');

INSERT INTO actors(pid, screenDate)
	VALUES ('a003', '1998-06-23');

INSERT INTO directors(pid, filmSchool, guildAvsryDate)
	VALUES ('a001', 'Great School', '1970-04-21');

--Query--
select *
from person;

select *
from movies;

select *
from directorsInMovies;

select *
from actorsInMovies;

select *
from actors;

select *
from directors;

--all the directors sean connery had worked with--
--select person.firstName, person.lastName
--from actorsInMovies, directorsInMovies, person
--where actorsInMovies.mid = directorsInMovies.mid
--and person.pid = directorsInMovies.pid;

select person.firstName, person.lastName
from person, directorsInMovies
where   person.pid = directorsInMovies.pid
and	directorsInMovies.mid = (select actorsInMovies.mid
				from actorsInMovies
				where actorsInMovies.pid = (select pid --sean connery's pid
							    from person
							    where person.firstName = 'Sean'
							    and   person.lastName = 'Connery'));