DROP TABLE Candidate CASCADE CONSTRAINTS;

CREATE TABLE Candidate(
  CID INT PRIMARY KEY,
  CName VARCHAR(15),
  Party VARCHAR(40),
  Location VARCHAR(15),
  WardNo Varchar(10));
  
 commit;
 
 
INSERT INTO Candidate VALUES(1, 'Abdul Rahman', 'Awami League', 'Dhaka', 'Ward 1');
INSERT INTO Candidate VALUES(2, 'Fatima Begum', 'Bangladesh Nationalist Party (BNP)', 'Chittagong', 'Ward 2');
INSERT INTO Candidate VALUES(3, 'Ayesha Khan', 'Workers Party of Bangladesh', 'Khulna', 'Ward 3');
INSERT INTO Candidate VALUES(4, 'Mohammed Ali', 'Jatiya Party', 'Rajshahi', 'Ward 4');
INSERT INTO Candidate VALUES(5, 'Kamal Hasan', 'Communist Party of Bangladesh', 'Sylhet', 'Ward 5');
INSERT INTO Candidate VALUES(6, 'Nusrat Jahan', 'Gono Forum', 'Barisal', 'Ward 6');
INSERT INTO Candidate VALUES(7, 'Zafar Ahmed', 'Jatiya Samajtantrik Dal', 'Rangpur', 'Ward 7');
INSERT INTO Candidate VALUES(8, 'Nazia Islam', 'Bangladesh Awami Workers Party', 'Comilla', 'Ward 8');
INSERT INTO Candidate VALUES(9, 'Iqbal Hussain', 'Islami Andolan Bangladesh', 'Cox''s Bazar', 'Ward 9');
INSERT INTO Candidate VALUES(10, 'Shahnaz Parveen', 'Bangladesh Jamaat-e-Islami', 'Mymensingh', 'Ward 10');
INSERT INTO Candidate VALUES(11, 'Rahim Mia', 'Bangladesh Jatiya Party', 'Narayanganj', 'Ward 11');


commit;
select * from Candidate;