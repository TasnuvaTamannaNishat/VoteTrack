SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE Update_VOTER_PACKAGE AS
    PROCEDURE UpdateVoterInfo(voter_name IN Voter.Name%type, new_voter_age IN Voter.VAge%type, new_voter_gender IN Voter.VGender%type, new_voter_address IN Voter.VAddress%type, new_voter_contact IN Voter.Contact%type);
END Update_VOTER_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY Update_VOTER_PACKAGE AS
    PROCEDURE UpdateVoterInfo(voter_name IN Voter.Name%type, new_voter_age IN Voter.VAge%type, new_voter_gender IN Voter.VGender%type, new_voter_address IN Voter.VAddress%type, new_voter_contact IN Voter.Contact%type) IS
    BEGIN
        IF new_voter_gender = 'Male' THEN
            UPDATE Voter1
            SET
                VAge = new_voter_age,
                VGender = new_voter_gender,
                VAddress = new_voter_address,
                Contact = new_voter_contact
            WHERE
                Name = voter_name;
            COMMIT;
        ELSIF new_voter_gender = 'Female' THEN
            UPDATE Voter2@site2
            SET
                VAge = new_voter_age,
                VGender = new_voter_gender,
                VAddress = new_voter_address,
                Contact = new_voter_contact
            WHERE
                Name = voter_name;
            COMMIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid gender input. Must be either "male" or "female".');
        END IF;
    END UpdateVoterInfo;
END Update_VOTER_PACKAGE;
/

ACCEPT VoterNameToUpdate PROMPT "Enter Voter Name to Update:";
ACCEPT NewVoterAgeInput PROMPT "Enter New Voter Age:";
ACCEPT NewVoterGenderInput PROMPT "Enter New Voter Gender:";
ACCEPT NewVoterAddressInput PROMPT "Enter New Voter Address:";
ACCEPT NewVoterContactInput PROMPT "Enter New Voter Contact:";

DECLARE
    VoterNameToUpdate Voter.Name%type := '&VoterNameToUpdate';
    NewVoterAge Voter.VAge%type := '&NewVoterAgeInput';
    NewVoterGender Voter.VGender%type := '&NewVoterGenderInput';
    NewVoterAddress Voter.VAddress%type := '&NewVoterAddressInput';
    NewVoterContact Voter.Contact%type := '&NewVoterContactInput';
BEGIN 
    Update_VOTER_PACKAGE.UpdateVoterInfo(VoterNameToUpdate, NewVoterAge, NewVoterGender, NewVoterAddress, NewVoterContact);
END;
/
