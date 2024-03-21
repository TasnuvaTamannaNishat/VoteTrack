DROP TABLE Votes CASCADE CONSTRAINTS;

CREATE TABLE Votes (
  VID INT PRIMARY KEY,
  Vtime DATE,
  CID INT,
  EID INT,
  VoterID INT,
  CONSTRAINT fk_candidate_votes
    FOREIGN KEY (CID)
    REFERENCES Candidate(CID),
  CONSTRAINT fk_elections_votes
    FOREIGN KEY (EID)
    REFERENCES Elections(EID),
  CONSTRAINT fk_voter_votes
    FOREIGN KEY (VoterID)
    REFERENCES Voter(VoterID)
);
INSERT INTO Votes VALUES (1, '15-january-2023', 1, 1, 1);
INSERT INTO Votes VALUES (2, '20-july-2022',  2, 2, 2);
INSERT INTO Votes VALUES (3, '05-march-2022',  3, 3, 3);
INSERT INTO Votes VALUES (4, '30-november-2021', 4, 4, 4);

commit;
select * from Votes;

