DELETE FROM SuperheroPowers;
DELETE FROM Powers;
DELETE FROM PowerTypes;
DELETE FROM SuperheroWeaknesses;
DELETE FROM Weaknesses;
DELETE FROM Sidekicks;
DELETE FROM Superheroes;

DROP TABLE IF EXISTS Superheroes;
DROP TABLE IF EXISTS Powers;
DROP TABLE IF EXISTS PowerTypes;
DROP TABLE IF EXISTS SuperheroPowers;
DROP TABLE IF EXISTS Sidekicks;
DROP TABLE IF EXISTS Weaknesses;
DROP TABLE IF EXISTS SuperheroWeaknesses;



CREATE TABLE `Superheroes` (
    `SuperheroId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `Gender`    TEXT NOT NULL,
    `Secret_ID` 
);

INSERT INTO Superheroes VALUES (null, 'Green Lantern', 'M', 'Green Room', 'Green');
INSERT INTO Superheroes VALUES (null, 'Wonder Woman', 'F', 'Themyscira', 'Blue, Gold, Red');
INSERT INTO Superheroes VALUES (null, 'Batman', 'M', 'Bat Cave', 'Grey');


CREATE TABLE `Sidekicks` (
    `SidekickId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `Gender`    TEXT NOT NULL,
    `Profession`    TEXT NOT NULL,
    `SuperheroId`    INTEGER NOT NULL,
    FOREIGN KEY(`SuperheroId`) REFERENCES `Superheroes`(`SuperheroId`)
);

INSERT INTO Sidekicks
  SELECT null, 'Robin', 'M', 'Neerdowell', SuperheroId
  FROM Superheroes s
  WHERE s.Name = 'Batman';


CREATE TABLE `PowerTypes` (
    `PowerTypeId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL
);

INSERT INTO PowerTypes VALUES (null, 'Physical');
INSERT INTO PowerTypes VALUES (null, 'Energy');


CREATE TABLE `Powers` (
    `PowerId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `PowerTypeId`    INTEGER NOT NULL,
    FOREIGN KEY(`PowerTypeId`) REFERENCES `PowerTypes`(`PowerTypeId`)
);

INSERT INTO Powers
  -- shortcut of sorts for adding a fk id to a table while searching for that id at the same time
  SELECT null, 'Super Strength', PowerTypeId
  FROM PowerType
  WHERE Name = 'Physical';

INSERT INTO Powers
  SELECT null, 'Elasticity', PowerTypeId
  FROM PowerType
  WHERE Name = 'Physical';

INSERT INTO Powers
  SELECT null, 'Laser Eyesight', PowerTypeId
  FROM PowerType
  WHERE Name = 'Energy';

INSERT INTO Powers
  SELECT null, 'Storm Power', PowerTypeId
  FROM PowerType
  WHERE Name = 'Energy';

INSERT INTO Powers
  SELECT null, 'Reality Manipulation', PowerTypeId
  FROM PowerType
  WHERE Name = 'Energy';


CREATE TABLE `SuperheroPowers` (
    `SuperheroPowerId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `SuperheroId`    INTEGER NOT NULL,
    `PowerId`    INTEGER NOT NULL,
    FOREIGN KEY(`PowerId`) REFERENCES `Powers`(`PowerId`),
    FOREIGN KEY(`SuperheroId`) REFERENCES `Superheroes`(`SuperheroId`)
);

INSERT INTO SuperheroPowers
  SELECT null, s.SuperheroId, p.PowerId
  FROM Powers p, Superheroes s
  WHERE s.Name = 'Wonder Woman' and p.Name = "Super Strength";

INSERT INTO SuperheroPowers
  SELECT null, s.SuperheroId, p.PowerId
  FROM Powers p, Superheroes s
  WHERE s.Name = 'Green Lantern' and p.Name = "Reality Manipulation";


CREATE TABLE `Weaknesses` (
    `WeaknessId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL
);

INSERT INTO Weaknesses VALUES (null, 'Yellow');


CREATE TABLE `SuperheroWeaknesses` (
    `SuperheroWeaknessId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `SuperheroId`    INTEGER NOT NULL,
    `WeaknessId`    INTEGER NOT NULL,
    FOREIGN KEY(`WeaknessId`) REFERENCES `Weaknesses`(`WeaknessId`),
    FOREIGN KEY(`SuperheroId`) REFERENCES `Superheroes`(`SuperheroId`)
);

INSERT INTO SuperheroWeaknesses
  SELECT null, s.SuperheroId, w.WeaknessId
  FROM Weaknesses w, Superheroes s
  WHERE s.Name = 'Green Lantern' and w.Name = "Yellow";