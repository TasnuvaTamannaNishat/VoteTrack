Drop table Election1 CASCADE CONSTRAINTS;
CREATE TABLE Election1 AS
SELECT EID, Ename, ELocation
FROM Elections;
commit;
select * from Election1;
