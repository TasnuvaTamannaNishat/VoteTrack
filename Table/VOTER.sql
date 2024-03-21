DROP TABLE Voter CASCADE CONSTRAINTS;
CREATE TABLE Voter(
  VoterID INT PRIMARY KEY,
  Name VARCHAR(30),
  VAge INT,
  VGender VARCHAR(6),
  VAddress VARCHAR(30),
  Contact VARCHAR(15)  
);
commit;
INSERT INTO Voter VALUES(1, 'Abdul Rahman', 30, 'Male', '123 Dhaka Road, Dhaka', '+8801712345678');
INSERT INTO Voter VALUES(2,'Fatima Begum', 25, 'Female', '456 Chittagong, Chittagong', '+8801812345678');
INSERT INTO Voter VALUES(3, 'Mohammed Ali', 40, 'Male', '789 Rajshahi Lane, Rajshahi', '+8801912345678');
INSERT INTO Voter VALUES(4, 'Ayesha Khan', 28, 'Female', '555 Khulna Street, Khulna', '+8801512345678');
INSERT INTO Voter VALUES(5, 'Kamal Hasan', 35, 'Male', '777 Sylhet Road, Sylhet', '+8801612345678');
INSERT INTO Voter VALUES(6, 'Nusrat Jahan', 32, 'Female', '999 Barisal, Barisal', '+8801912345678' );


commit;
select * from voter;