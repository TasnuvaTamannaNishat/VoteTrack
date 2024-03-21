SET SERVEROUTPUT ON;

DECLARE
  age_range VARCHAR2(10);
  votes_count NUMBER;
  total_votes NUMBER;
  percentage NUMBER;
BEGIN
  -- Calculate the total number of votes
  SELECT COUNT(*) INTO total_votes FROM Votes;
  
  -- Age range 18-25
  SELECT COUNT(*) INTO votes_count FROM Votes v
  JOIN Voter vt ON v.VoterID = vt.VoterID
  WHERE vt.VAge >= 18 AND vt.VAge <= 25;
  age_range := '18-25';
  percentage := (votes_count / total_votes) * 100;
  DBMS_OUTPUT.PUT_LINE('Age Range: ' || age_range || ', Votes: ' || votes_count || ', Percentage: ' || percentage || '%');
  
  -- Age range 26-35
  SELECT COUNT(*) INTO votes_count FROM Votes v
  JOIN Voter vt ON v.VoterID = vt.VoterID
  WHERE vt.VAge > 25 AND vt.VAge <= 35;
  age_range := '26-35';
  percentage := (votes_count / total_votes) * 100;
  DBMS_OUTPUT.PUT_LINE('Age Range: ' || age_range || ', Votes: ' || votes_count || ', Percentage: ' || percentage || '%');
  
  -- Age range 36-45
  SELECT COUNT(*) INTO votes_count FROM Votes v
  JOIN Voter vt ON v.VoterID = vt.VoterID
  WHERE vt.VAge > 35 AND vt.VAge <= 45;
  age_range := '36-45';
  percentage := (votes_count / total_votes) * 100;
  DBMS_OUTPUT.PUT_LINE('Age Range: ' || age_range || ', Votes: ' || votes_count || ', Percentage: ' || percentage|| '%');
  
  -- Age range 46-55
  SELECT COUNT(*) INTO votes_count FROM Votes v
  JOIN Voter vt ON v.VoterID = vt.VoterID
  WHERE vt.VAge > 45 AND vt.VAge <= 55;
  age_range := '46-55';
  percentage := (votes_count / total_votes) * 100;
  DBMS_OUTPUT.PUT_LINE('Age Range: ' || age_range || ', Votes: ' || votes_count || ', Percentage: ' || percentage|| '%');
  
  -- Age range 56+
  SELECT COUNT(*) INTO votes_count FROM Votes v
  JOIN Voter vt ON v.VoterID = vt.VoterID
  WHERE vt.VAge > 55;
  age_range := '56+';
  percentage := (votes_count / total_votes) * 100;
  DBMS_OUTPUT.PUT_LINE('Age Range: ' || age_range || ', Votes: ' || votes_count || ', Percentage: ' || percentage || '%');
END;
/
