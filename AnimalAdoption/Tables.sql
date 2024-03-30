CREATE TABLE User (
    Username VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    City varchar(50)
);


CREATE TABLE Animal (
    ID VARCHAR(50) PRIMARY KEY,
    Type VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Breed VARCHAR(50),
    Sex VARCHAR(50),
    Age VARCHAR(50),
    Color VARCHAR(50),
    Size VARCHAR(50),
    Description VARCHAR(100) 
);


CREATE TABLE Request (
    ID VARCHAR(50) PRIMARY KEY,
    User_Username VARCHAR(50) NOT NULL,
    Animal_ID VARCHAR(50) NOT NULL,
    Animal_Name VARCHAR(50) NOT NULL,
    Animal_Description VARCHAR(1000),
    SurveyAnswer VARCHAR(1000),
    FOREIGN KEY (User_Username) REFERENCES User(Username) ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (Animal_ID) REFERENCES Animal(ID) ON UPDATE RESTRICT ON DELETE RESTRICT
);


CREATE TABLE Admin (
    Username VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL 
);


CREATE TABLE History (
    Request_ID VARCHAR(50) PRIMARY KEY, 
    User_Username VARCHAR(50) NOT NULL,
    Animal_ID VARCHAR(50) NOT NULL,
    Animal_Name VARCHAR(50) NOT NULL,
    RequestDate DATE,
    AdoptionDate DATE,
    Status TINYINT(1),
    Interval_time int,

    FOREIGN KEY (Request_ID) REFERENCES Request(ID),
    FOREIGN KEY (Username) REFERENCES User(Username),
    FOREIGN KEY (Animal_ID) REFERENCES Animal(ID) 
);


CREATE TABLE ContactusMessage (
    Username VARCHAR(50),
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Message VARCHAR(1000) NOT NULL,
    FOREIGN KEY (Username) REFERENCES User(Username)
);

CREATE TABLE Vet_Record (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Animal_ID VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Vet_Name VARCHAR(50),
    v_Procedure VARCHAR(255),
    FOREIGN KEY (Animal_ID) REFERENCES Animal(ID)
);

CREATE TABLE Donation (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Type VARCHAR(50), 
    Description VARCHAR(255),
    FOREIGN KEY (Username) REFERENCES User(Username) 
);

CREATE TABLE Volunteer (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    Contact_Info VARCHAR(255),
    About VARCHAR(255),
    Availability VARCHAR(100),
    FOREIGN KEY (Username) REFERENCES User(Username)
);
