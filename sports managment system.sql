-- Create Coach table
CREATE TABLE Coach (
    Coach_Id INT PRIMARY KEY,
    Coach_Name VARCHAR(50),
    Experience INT,
    Coach_Age INT,
    Coach_Subject VARCHAR(50)
);

-- Create Teams table
CREATE TABLE Teams (
    Team_Id INT PRIMARY KEY,
    Team_Name VARCHAR(50),
    Home_Ground VARCHAR(50),
    Coach_Id INT,
    FOREIGN KEY (Coach_Id) REFERENCES Coach(Coach_Id)
);

-- Create Player table
CREATE TABLE Player (
    Player_Id INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Player_Experience INT,
    Player_Age INT
);
  use sports-management-system
-- Create Matches table
CREATE TABLE Matches (
    Match_Id INT PRIMARY KEY,
    Ground VARCHAR(50),
    Date DATE,
    Any_Team_Id INT,
    FOREIGN KEY (Any_Team_Id) REFERENCES Teams(Team_Id)
);

-- Create Scores table
CREATE TABLE Score (
    Match_Id INT,
    Home_Score INT,
    Away_Score INT,
    Win_Score INT,
    FOREIGN KEY (Match_Id) REFERENCES Matches(Match_Id)
);

-- Create associative table for Team-Player relationship
CREATE TABLE Team_Player (
    Team_Id INT,
    Player_Id INT,
    PRIMARY KEY (Team_Id, Player_Id),
    FOREIGN KEY (Team_Id) REFERENCES Teams(Team_Id),
    FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id)
);

-- Create associative table for Match-Teams relationship
CREATE TABLE Match_Teams (
    Match_Id INT,
    Team_Id INT,
    PRIMARY KEY (Match_Id, Team_Id),
    FOREIGN KEY (Match_Id) REFERENCES Matches(Match_Id),
    FOREIGN KEY (Team_Id) REFERENCES Teams(Team_Id)
);