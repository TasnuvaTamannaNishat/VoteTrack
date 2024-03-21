
DROP TABLE Candidate1 CASCADE CONSTRAINTS;
CREATE TABLE Candidate1 AS
SELECT CID, CName, Party, Location
FROM Candidate
WHERE Party = 'Awami League';
commit;
select * from Candidate1;
