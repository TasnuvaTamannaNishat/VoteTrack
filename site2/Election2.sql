Drop table Election2 CASCADE CONSTRAINTS;
CREATE TABLE Election2 AS
SELECT EID, EDate
FROM Elections;

commit; 
select * from Election2;
