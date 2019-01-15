-- DELETE FROM Users;
-- DELETE FROM Relationships;
-- DELETE FROM Messages;
-- DELETE FROM Events;
-- DELETE FROM News_Articles;
-- DELETE FROM Tasks;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Relationships;
DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS News_Articles;
DROP TABLE IF EXISTS Tasks;

PRAGMA foreign_keys = ON;

CREATE TABLE `Users` (
    `UserId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Email`    TEXT NOT NULL,
    `Password`    TEXT NOT NULL,
    `DisplayName`    TEXT NOT NULL
);

INSERT INTO Users VALUES (null, '123@1.com', '123', 'Green Room');
INSERT INTO Users VALUES (null, 'aetwr@gwer.com', '123', 'Themyscira');
INSERT INTO Users VALUES (null, '2343@fge.com', '123', 'Bat Cave');


CREATE TABLE `Relationships` (
    `RelationshipId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `UserId`    INTEGER NOT NULL,
    `FriendId`    INTEGER NOT NULL,
    FOREIGN KEY(`UserId`) 
    REFERENCES `Users`(`UserId`)
    ON DELETE cascade
    FOREIGN KEY(`FriendId`) 
    REFERENCES `Users`(`UserId`)
    ON DELETE cascade
);

INSERT INTO Relationships
  SELECT null, 1, 2;

INSERT INTO Relationships
  SELECT null, 2, 3;


CREATE TABLE `Messages` (
    `MessageId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Text`    TEXT NOT NULL,
    `IsEdited` BOOLEAN NOT NULL,
    `UserId` INTEGER NOT NULL,
    FOREIGN KEY(`UserId`) 
    REFERENCES `Users`(`UserId`)
    ON DELETE cascade
);

INSERT INTO Messages VALUES (null, 'This is a message', 0, 1);
INSERT INTO Messages VALUES (null, 'This is another message', 1, 2);


CREATE TABLE `Events` (
    `EventId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `Location` TEXT NOT NULL,
    `Date` TEXT NOT NULL,
    `UserId` INTEGER NOT NULL,
    FOREIGN KEY(`UserId`) 
    REFERENCES `Users`(`UserId`)
    ON DELETE cascade
);

INSERT INTO Events VALUES (null, 'Event Name', 'Nashville', '12/1/2019', 1);
INSERT INTO Events VALUES (null, 'Another Event Name', 'Nashville', '2/1/2019', 3);


CREATE TABLE `News_Articles` (
    `News_ArticlesId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Title`    TEXT NOT NULL,
    `Summary`    TEXT NOT NULL,
    `Timestamp`    TEXT NOT NULL,
    `URL`    TEXT NOT NULL,
    `UserId` INTEGER NOT NULL,
    FOREIGN KEY(`UserId`) 
    REFERENCES `Users`(`UserId`)
    ON DELETE cascade
);

INSERT INTO News_Articles VALUES (null, 'Another article title', 'summary here', '2/1/2019', 'eglere.com', 3);
INSERT INTO News_Articles VALUES (null, 'article title', 'summary here', '3/1/2019', 'eglwererre.com', 1);
INSERT INTO News_Articles VALUES (null, 'article', 'summary here', '1/1/2019', 'rerer.com', 2);


CREATE TABLE `Tasks` (
    `TaskId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Name`    TEXT NOT NULL,
    `DueBy`    TEXT NOT NULL,
    `Status`    TEXT NOT NULL,
    `UserId` INTEGER NOT NULL,
    FOREIGN KEY(`UserId`) 
    REFERENCES `Users`(`UserId`)
    ON DELETE cascade
);

INSERT INTO Tasks VALUES (null, 'mow lawn', '2/1/2019', 'completed', 3);
INSERT INTO Tasks VALUES (null, 'shopping', '3/1/2019', 'in process', 1);
INSERT INTO Tasks VALUES (null, 'laundry', '1/1/2019', 'completed', 2);

