CREATE TABLE MOVIE(
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  NAME VARCHAR(255) NOT NULL,
  IMAGES VARCHAR(1000),
  VIDEOS VARCHAR(1000),
  LANGUAGE VARCHAR(255) NOT NULL,
  DURATION_IN_MINUTES INTEGER,
  GENRE VARCHAR(255),
  RELEASE_DATE DATE NOT NULL,
  CERTIFICATE_DETAILS VARCHAR(255),
  MOVIE_CAST VARCHAR(1000),
  MOVIE_CREW VARCHAR(1000),
  SYNOPSIS VARCHAR(1000),
  FORMAT VARCHAR(255) DEFAULT 2D
  );

CREATE TABLE THEATRE(
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  NAME VARCHAR2(255) NOT NULL,
  AREA VARCHAR2(255) NOT NULL,
  CITY VARCHAR2(255) NOT NULL,
  STATE VARCHAR2(255) NOT NULL,
  PINCODE VARCHAR2(255) NOT NULL,
  ADDRESS VARCHAR2(1000) NOT NULL,
  MAP_LOCATION_LINK VARCHAR2(255),
  IMAGES VARCHAR2(1000),
  AVAILABLE_FACILITIES VARCHAR2(1000),
  PARKING_AVAILABLE BOOLEAN DEFAULT TRUE,
  FOOD_COURT_AVAILABLE BOOLEAN DEFAULT TRUE
  );

CREATE TABLE THEATRE_SCREEN(
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  THEATRE_ID INTEGER NOT NULL,
  SCREEN_NUMBER INTEGER NOT NULL,
  FOREIGN KEY (THEATRE_ID) REFERENCES THEATRE(ID)
  );

CREATE TABLE MOVIE_SHOW(
  MOVIE_ID INTEGER,
  THEATRE_SCREEN_ID INTEGER,
  SHOW_TIME TIMESTAMP,
  PRIMARY KEY (MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME),
  FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(ID),
  FOREIGN KEY (THEATRE_SCREEN_ID) REFERENCES THEATRE_SCREEN(ID)
  );
  

INSERT INTO MOVIE(NAME, LANGUAGE, DURATION_IN_MINUTES, RELEASE_DATE) 
VALUES('DASARA', 'TELUGU', 150, '25-APR-23');
INSERT INTO MOVIE(NAME, LANGUAGE, DURATION_IN_MINUTES, RELEASE_DATE) 
VALUES('AVATAR: THE WAY OF WATER', 'ENGLISH', 120, '25-APR-23');
COMMIT;

INSERT INTO THEATRE(NAME , AREA, CITY , STATE , PINCODE, ADDRESS) 
VALUES('PVR', 'HI-TEC', 'HYDERABAD', 'TELANGANA', '500081', 'NEAR TO METRO STATION');
INSERT INTO THEATRE(NAME , AREA, CITY , STATE , PINCODE, ADDRESS) 
VALUES('INOX', 'AMEERPET', 'HYDERABAD', 'TELANGANA', '500082', 'NEAR TO RELIANCE DIGITAL');
COMMIT;

INSERT INTO THEATRE_SCREEN(THEATRE_ID , SCREEN_NUMBER) 
VALUES(1,1);
INSERT INTO THEATRE_SCREEN(THEATRE_ID , SCREEN_NUMBER) 
VALUES(1,2);
INSERT INTO THEATRE_SCREEN(THEATRE_ID , SCREEN_NUMBER) 
VALUES(1,3);
INSERT INTO THEATRE_SCREEN(THEATRE_ID , SCREEN_NUMBER) 
VALUES(1,4);
INSERT INTO THEATRE_SCREEN(THEATRE_ID , SCREEN_NUMBER) 
VALUES(2,1);
COMMIT;

INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(1,1,'2023-04-25 09:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(1,2,'2023-04-25 12:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(2,7,'2023-04-25 09:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(2,5,'2023-04-25 13:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(1,1,'2023-04-26 09:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(1,2,'2023-04-26 12:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(2,7,'2023-04-26 09:00:00');
INSERT INTO MOVIE_SHOW(MOVIE_ID, THEATRE_SCREEN_ID, SHOW_TIME)
VALUES(2,5,'2023-04-26 13:00:00');
COMMIT;