-- question 1

INSERT INTO Book values ('96-42013-10510', 'Title Growing your own Weeds', '2012', 10000);
INSERT INTO locatedAt values ('Main', '96-42013-10510', null, null, 8, 2);

-- question 2
UPDATE locatedAt SET total_copies = 8 WHERE ISBN = '96-42103-10907 'AND lname = 'Main' ;

-- question 3
delete from Author where first_name = 'Grace' and last_name = 'Slick';
-- question 4
INSERT INTO Author values ('305', 'Commander', 'Adams');

-- question 5
INSERT INTO locatedAt values ('South Park', '96-42013-10510', null, null, 8, 3);
-- question 6
delete from locatedAt where ISBN= '96-42103-11003' and lname = 'Main';

-- question 7
UPDATE locatedAt SET total_copies = 4 where ISBN = '96-42103-11604'AND lname = 'South Park';
-- question 8
INSERT INTO Book values ('96-42013-10513', 'Title Growing your own Weeds', '2012', 90000);

-- question 9
select*from Audit;