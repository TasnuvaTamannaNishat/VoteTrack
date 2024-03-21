SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE GenderPackage AS
    FUNCTION FindMostVotedPartyByGender(p_gender IN VARCHAR2) RETURN VARCHAR2;
END GenderPackage;
/

CREATE OR REPLACE PACKAGE BODY GenderPackage AS
  FUNCTION FindMostVotedPartyByGender(p_gender IN VARCHAR2) RETURN VARCHAR2 IS
    most_voted_party VARCHAR2(100);
    partymale VARCHAR2(100);
    partyfemale VARCHAR2(100);
    mvotecount NUMBER;
    fvotecount NUMBER;
  BEGIN
    IF p_gender = 'Male' THEN
      FOR rec IN (
        SELECT c.Party, COUNT(*) AS vote_count
        FROM Candidate c
        JOIN Votes v ON c.CID = v.CID
        JOIN Voter vt ON v.VoterID = vt.VoterID
        WHERE vt.VGender = 'Male'
        GROUP BY c.Party
        ORDER BY COUNT(*) DESC
      )
      LOOP
        partymale := rec.Party;
        mvotecount := rec.vote_count;
        EXIT; -- Exit the loop after fetching the first row
      END LOOP;
      most_voted_party := partymale;
    ELSIF p_gender = 'Female' THEN
      FOR rec IN (
        SELECT c.Party, COUNT(*) AS vote_count
        FROM Candidate c
        JOIN Votes v ON c.CID = v.CID
        JOIN Voter vt ON v.VoterID = vt.VoterID
        WHERE vt.VGender = 'Female'
        GROUP BY c.Party
        ORDER BY COUNT(*) DESC
      )
      LOOP
        partyfemale := rec.Party;
        fvotecount := rec.vote_count;
        EXIT; -- Exit the loop after fetching the first row
      END LOOP;
      most_voted_party := partyfemale;
    ELSE
      most_voted_party := null; -- Return null for any other gender
    END IF;

    RETURN most_voted_party; -- Return the result
  END FindMostVotedPartyByGender;
END GenderPackage;
/

DECLARE
  most_voted_party_male VARCHAR2(100);
  most_voted_party_female VARCHAR2(100);
BEGIN
  most_voted_party_male := GenderPackage.FindMostVotedPartyByGender('Male');
  most_voted_party_female := GenderPackage.FindMostVotedPartyByGender('Female');

  DBMS_OUTPUT.PUT_LINE('Most voted party by male voters: ' || most_voted_party_male);
  DBMS_OUTPUT.PUT_LINE('Most voted party by female voters: ' || most_voted_party_female);
END;
/
