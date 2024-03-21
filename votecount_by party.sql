DECLARE
  total_votes_all NUMBER;
  party_name VARCHAR2(100);
  total_votes_party NUMBER;
  percentage_votes NUMBER;
BEGIN
 
  SELECT COUNT(*) INTO total_votes_all
  FROM Votes;

  
  FOR party_rec IN (
    SELECT c.Party, COUNT(*) AS TotalVotes
    FROM Candidate c
    JOIN Votes v ON c.CID = v.CID
    GROUP BY c.Party
  )
  LOOP
    party_name := party_rec.Party;
    total_votes_party := party_rec.TotalVotes;

    
    percentage_votes := (total_votes_party * 100.0) / total_votes_all;

    
    DBMS_OUTPUT.PUT_LINE('Party: ' || party_name || ', Total Votes: ' || total_votes_party || ', Percentage of Votes: ' || percentage_votes || '%');
  END LOOP;
END;
/
