Drop table Elections CASCADE CONSTRAINTS;
CREATE TABLE Elections(
  EID INT PRIMARY KEY,
  Ename VARCHAR(50),
  EDate DATE,
  ELocation VARCHAR(20));
COMMIT;
INSERT INTO Elections VALUES (1, '11th National Parliamentary Election', '15-january-2023', 'Dhaka');
INSERT INTO Elections VALUES (2, '10th Dhaka South City Corporation Election', '20-april-2021', 'Dhaka South');
INSERT INTO Elections VALUES (3, '7th Upazila Parishad Election (Chittagong)', '16-june-2021', 'Chittagong');
INSERT INTO Elections VALUES (4, '4th Sylhet City Municipal Election',  '7-february-2021', 'Sylhet City');
INSERT INTO Elections VALUES (5, '2nd Union Council Election (Rajshahi)','5-October-2023', 'Rajshahi');
INSERT INTO Elections VALUES (6, '9th Chittagong City Corporation Election',  '6-December-2021', 'Chittagong');
INSERT INTO Elections VALUES (7, '5th Upazila Parishad Election (Barishal)',  '18-july-2022', 'Barishal');
INSERT INTO Elections VALUES (8, '3rd Khulna City Municipal Election', '25-October-2021', 'Khulna City');
INSERT INTO Elections VALUES (9, '1st Union Council Election (Mymensingh)',  '3-December-2023', 'Mymensingh');
INSERT INTO Elections VALUES (10, '6th Rajshahi City Corporation Election', '15-july-2022', 'Rajshahi');

commit;
SELECT* from Elections;