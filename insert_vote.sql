SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE FUNCTION CheckDuplicateVote(
  p_voterid IN INT,
  p_eid IN INT,
  p_vtime IN DATE
) RETURN BOOLEAN AS
  vote_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO vote_count
  FROM Votes
  WHERE VoterID = p_voterid
    AND EID = p_eid
    AND EXTRACT(YEAR FROM Vtime) = EXTRACT(YEAR FROM p_vtime);
  
  IF vote_count > 0 THEN
    RETURN TRUE; 
  ELSE
    RETURN FALSE; 
  END IF;
END;
/

DECLARE
  inputvid INT;
  inputvoterid INT;
  inputeid INT;
  inputcid INT;
  inputvtime DATE;
  inputcount INT;
BEGIN
  inputvid := &EnterVID;
  inputvoterid := &EnterVoterID; 
  inputeid := &EnterEID;         
  inputcid := &EnterCID;         
  inputvtime := TO_DATE('&EnterVTime', 'DD-MONTH-YYYY');   

  IF CheckDuplicateVote(inputvoterid, inputeid, inputvtime) THEN
    DBMS_OUTPUT.PUT_LINE('The voter has already voted in the same election and year. Cannot insert duplicate vote.');
  ELSE
    INSERT INTO Votes (VID,VoterID, EID, CID, Vtime)
    VALUES (inputvid, inputvoterid, inputeid, inputcid, inputvtime);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Voter record inserted successfully.');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER DisplayVoteInsertedMsg
AFTER INSERT ON Votes
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Vote inserted successfully!');
END DisplayVoteInsertedMsg;
/
