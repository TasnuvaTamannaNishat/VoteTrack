SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE INSERT_VOTER_PACKAGE AS
    PROCEDURE InsertVoterIntoSite1(VoterId IN Voter.VoterID%type ,voter_name IN Voter.Name%type, voter_age IN Voter.VAge%type, voter_gender IN Voter.VGender%type, voter_address IN Voter.VAddress%type, voter_contact IN Voter.Contact%type);
    PROCEDURE InsertVoterIntoSite2(VoterId in Voter.VoterID%type,voter_name IN Voter.Name%type, voter_age IN Voter.VAge%type, voter_gender IN Voter.VGender%type, voter_address IN Voter.VAddress%type, voter_contact IN Voter.Contact%type);
END INSERT_VOTER_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY INSERT_VOTER_PACKAGE AS
    PROCEDURE InsertVoterIntoSite1(VoterId in Voter.VoterID%type,voter_name IN Voter.Name%type, voter_age IN Voter.VAge%type, voter_gender IN Voter.VGender%type, voter_address IN Voter.VAddress%type, voter_contact IN Voter.Contact%type) IS
    BEGIN
        INSERT INTO Voter1 (VoterID,Name, VAge, VGender, VAddress, Contact)
        
        VALUES (VoterId,voter_name, voter_age, voter_gender, voter_address, voter_contact);
        COMMIT;
    END InsertVoterIntoSite1;

    PROCEDURE InsertVoterIntoSite2(VoterId in Voter.VoterID%type,voter_name IN Voter.Name%type, voter_age IN Voter.VAge%type, voter_gender IN Voter.VGender%type, voter_address IN Voter.VAddress%type, voter_contact IN Voter.Contact%type) IS
    BEGIN
        INSERT INTO Voter2@site2 (VoterID,Name, VAge, VGender, VAddress, Contact)
        VALUES (VoterId,voter_name, voter_age, voter_gender, voter_address, voter_contact);
        COMMIT;
    END InsertVoterIntoSite2;
END INSERT_VOTER_PACKAGE;
/

ACCEPT VoterIdInput PROMPT "Enter Voter Id:";
ACCEPT VoterNameInput PROMPT "Enter Voter Name:";
ACCEPT VoterAgeInput PROMPT "Enter Voter Age:";
ACCEPT VoterGenderInput PROMPT "Enter Voter Gender:";
ACCEPT VoterAddressInput PROMPT "Enter Voter Address:";
ACCEPT VoterContactInput PROMPT "Enter Voter Contact:";

DECLARE
	VoterId Voter.VoterID%type := '&VoterIdInput';
    VoterName Voter.Name%type := '&VoterNameInput';
    VoterAge Voter.VAge%type := '&VoterAgeInput';
    VoterGender Voter.VGender%type := '&VoterGenderInput';
    VoterAddress Voter.VAddress%type := '&VoterAddressInput';
    VoterContact Voter.Contact%type := '&VoterContactInput';
BEGIN 
    IF VoterGender = 'Male' THEN
        INSERT_VOTER_PACKAGE.InsertVoterIntoSite1(VoterId,VoterName, VoterAge, VoterGender, VoterAddress, VoterContact);
    ELSIF VoterGender = 'Female' THEN
        INSERT_VOTER_PACKAGE.InsertVoterIntoSite2(VoterId,VoterName, VoterAge, VoterGender, VoterAddress, VoterContact);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid gender input. Must be either "Male" or "Female".');
    END IF;
END;
/
