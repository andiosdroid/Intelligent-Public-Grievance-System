CREATE TYPE Type AS ENUM ('Potholes','Pipeline Issue','Parking Issue','Animal distress');

CREATE TABLE Users(
	 U_Id serial PRIMARY KEY,
	 U_Name text,
	 U_Add text,
	 U_Dob date
);

CREATE TABLE Issues(
	I_Id serial  PRIMARY KEY,
	I_Title text,
	I_Content text,
	/* 6decimal places give precision of 0.111 m, hence using real*/
	I_Lat real,
	I_Lng real,
	/*C_Image image, Cant get this working now as I dont have that much 
	knowledge. However I understood this much PSQL has support for 
	Something called as blobs to store image ojects.
	link:http://www.postgresql.org/docs/9.1/static/lo.html*/
	I_AnonFlag boolean,
	/*0- non anonymous, 1- anonymous*/
	I_Type Type,
	/*created a enum of type of issues.*/
	I_Author serial references Users(U_Id),
	I_time timestamptz,

);

CREATE TABLE Comments(
	C_Id serial references Issues(I_Id),
	C_SqNo serial,
	C_Content text,
	/*Time stamp with timezone*/
	C_time timestamptz,
	C_Author serial references Users(U_Id)


);

CREATE TABLE Votes(
	V_IssueId serial PRIMARY KEY references Issues(I_Id),
	V_Author serial references Users(U_Id),
	V_Flag boolean,
	/*0-Dislike 1- Like*/
	V_time timestamptz

);