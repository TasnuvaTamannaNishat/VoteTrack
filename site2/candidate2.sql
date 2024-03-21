DROP TABLE Candidate2 CASCADE CONSTRAINTS;
CREATE TABLE Candidate2 AS
SELECT CID, CName, Party, Location
FROM Candidate
WHERE Party != 'BangladeshAwamiLeague';
commit;
select* from Candidate2;
