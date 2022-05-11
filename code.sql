CREATE DATABASE project;
USE project;

CREATE TABLE companies(
    cid INTEGER PRIMARY KEY,
    cname varchar(20),
    location varchar(20),
    mf_capacity INTEGER);
    
CREATE TABLE vaccine(
    vid INTEGER PRIMARY KEY,
    cid INTEGER,
    vname varchar(20),
    efficacy DECIMAL(5,2),
    day_bw_doses INTEGER,
CONSTRAINT fk_companies FOREIGN KEY(cid) REFERENCES companies(cid));

CREATE TABLE center(
    centerid INTEGER PRIMARY KEY,
    centername varchar(20),
    address varchar(20),
    capacity INTEGER,
	vid INTEGER,
CONSTRAINT fk_vaccine FOREIGN KEY(vid) REFERENCES vaccine(vid));
    
CREATE TABLE vaccinator(
    id INTEGER PRIMARY KEY,
    name varchar(20));
    
CREATE TABLE person(
    pid INTEGER PRIMARY KEY,
    fname varchar(20),
    lname varchar(20),
    age INTEGER, 
    city varchar(20),
    contact varchar(20));
    
CREATE TABLE works(
    centerid INTEGER,
    id INTEGER,
    PRIMARY KEY(centerid,id),
CONSTRAINT fk_center1 FOREIGN KEY(centerid) REFERENCES center(centerid),
CONSTRAINT fk_vaccinator1 FOREIGN KEY(id) REFERENCES vaccinator(id));
    
CREATE TABLE book_slot(
    centerid INTEGER,
    pid INTEGER,
    id INTEGER,
    sdate DATE,
    dose INTEGER,
PRIMARY KEY(centerid,pid,dose),
CONSTRAINT fk_center2 FOREIGN KEY(centerid) REFERENCES center(centerid),
CONSTRAINT fk_person2 FOREIGN KEY(pid) REFERENCES person(pid),
CONSTRAINT fk_vaccinator2 FOREIGN KEY(id) REFERENCES vaccinator(id));
