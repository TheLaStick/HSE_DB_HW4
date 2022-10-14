CREATE SCHEMA IF NOT EXISTS Library;

CREATE TABLE IF NOT EXISTS Library.Reader (
  ReaderID SERIAL PRIMARY KEY,
  FirstName TEXT,
  LastName TEXT,
  Birthday TIMESTAMP,
  Adress TEXT
);

CREATE TABLE IF NOT EXISTS Library.Publisher (
  PublisherName TEXT PRIMARY KEY,
  Adress TEXT
);

CREATE TABLE IF NOT EXISTS Library.Book (
  ISBN SERIAL PRIMARY KEY,
  Year TIMESTAMP,
  Title TEXT,
  Author TEXT,
  PageCount INT,
  PublisherName TEXT,
  CategoryName TEXT
);

CREATE TABLE IF NOT EXISTS Library.Category (
  CategoryName TEXT PRIMARY KEY,
  ParentCategoryName TEXT
);

CREATE TABLE IF NOT EXISTS Library.Copy (
  CopyID SERIAL,
  Position INT,
  ISBN INT,
  PRIMARY KEY (CopyID, ISBN)
);

CREATE TABLE IF NOT EXISTS Library.BorrowBook (
  ReaderID INT,
  CopyID INT,
  ISBN SERIAL,
  ReturnDate TIMESTAMP,
  PRIMARY KEY (ReaderID, CopyID, ISBN, ReturnDate)
);

ALTER TABLE Library.Book ADD FOREIGN KEY (PublisherName) REFERENCES Library.Publisher (PublisherName);
ALTER TABLE Library.Book ADD FOREIGN KEY (CategoryName) REFERENCES Library.Category (CategoryName);

ALTER TABLE Library.BorrowBook ADD FOREIGN KEY (ReaderID) REFERENCES Library.Reader (ReaderID);
ALTER TABLE Library.BorrowBook ADD FOREIGN KEY (CopyID, ISBN) REFERENCES Library.Copy (CopyID, ISBN);

ALTER TABLE Library.Copy ADD FOREIGN KEY (ISBN) REFERENCES Library.Book (ISBN);
