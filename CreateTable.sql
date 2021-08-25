
CREATE TABLE Phone ( 
    PNumber             VARCHAR(15)    NOT NULL,
    phone_type          VARCHAR(5)     NOT NULL,
    PRIMARY KEY (PNumber)
);


CREATE TABLE Author ( 
    AuthorID            INT             NOT NULL,
    first_name          VARCHAR(50)     NOT NULL,
    last_name           VARCHAR(50)     NOT NULL,
    PRIMARY KEY (AuthorID)
);

CREATE TABLE authorPhone (
    AuthorID            INT            NOT NULL,
    PNumber             VARCHAR(50)    NOT NULL,
    FOREIGN KEY (PNumber) REFERENCES Phone (PNumber) ON DELETE RESTRICT,
    FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID) ON DELETE RESTRICT
);

CREATE TABLE Publisher ( 
    PubID               INT             NOT NULL,
    Pub_name            VARCHAR(50)     NOT NULL,
    PRIMARY KEY (PubID)
);

CREATE TABLE publisherPhone (
    PubID               INT            NOT NULL,
    PNumber             VARCHAR(50)    NOT NULL,
    FOREIGN KEY (PNumber) REFERENCES Phone (PNumber) ON DELETE RESTRICT,
    FOREIGN KEY (PubID) REFERENCES Publisher (PubID) ON DELETE RESTRICT
);

CREATE TABLE Book ( 
    ISBN                VARCHAR(50)     NOT NULL,
    Title               VARCHAR(50)     NOT NULL,
    year_published      VARCHAR(6)      NOT NULL,
    PubID               INT             NOT NULL,  
    FOREIGN KEY (PubID) REFERENCES Publisher (PubID) ON DELETE RESTRICT,
    PRIMARY KEY (ISBN) 
);

CREATE TABLE WrittenBy (
    ISBN                VARCHAR(50)    NOT NULL,
    AuthorID            INT            NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN) ON DELETE RESTRICT,
    FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID) ON DELETE RESTRICT
);

CREATE TABLE Member (
    MemberID            INT              NOT NULL,
    first_name          VARCHAR(50)      NOT NULL,
    last_name           VARCHAR(50)      NOT NULL,
    DOB                 DATE             NOT NULL,
    Gender              VARCHAR(5)       NOT NULL,
    PRIMARY KEY (MemberID)
);
CREATE TABLE Library (
    lname               VARCHAR(15)     NOT NULL,
    Street              VARCHAR(20)     NOT NULL,
    city                VARCHAR(20)     NOT NULL,
    l_state             VARCHAR(10)     NOT NULL,
    PRIMARY KEY (lname)
);

CREATE TABLE BorrowedBy (
    lname               VARCHAR(15)     NOT NULL,
    ISBN                VARCHAR(50)     NOT NULL,
    MemberID            INT             NOT NULL,
    checkout_date       date            NOT NULL,
    checkin_date        date            NULL,
    FOREIGN KEY (lname) REFERENCES Library (lname) ON DELETE RESTRICT,
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN) ON DELETE RESTRICT,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID) ON DELETE RESTRICT
);


CREATE TABLE locatedAt(
    lname               VARCHAR(15)     NOT NULL,
    ISBN                VARCHAR(50)     NOT NULL,
    total_copies        INT             NULL,
    copies_not_checkedout INT           NULL,
    shelf               INT             NULL,
    at_floor            INT             NULL,
    FOREIGN KEY (lname) REFERENCES Library(lname) ON DELETE RESTRICT,
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN) ON DELETE RESTRICT  
);

CREATE TABLE Audit (
    id            INT             NOT NULL AUTO_INCREMENT, 
    table_name           VARCHAR(20)    NOT NULL,
    action_value        VARCHAR(15)     NOT NULL,
    dt                  DATETIME        NULL,
    PRIMARY KEY (id)
);

