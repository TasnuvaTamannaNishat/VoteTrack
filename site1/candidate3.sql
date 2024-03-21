DROP TABLE Candidate3 CASCADE CONSTRAINTS;
CREATE TABLE Candidate3 AS
SELECT CID, WardNo
FROM Candidate;
commit;
select * from Candidate3;