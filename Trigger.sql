-- question 5.1
select * from Library ORDER BY lname;


-- question 5.2

 select*from locatedAt ORDER BY ISBN;
-- question 5.3
select DISTINCT b.Title, la.total_copies, la.lname from Book b, locatedAt la, locatedAt al,Library l 
where  la.ISBN = al.ISBN AND la.ISBN = b.ISBN  AND la.lname != al.lname ORDER BY b.Title;

-- question 5.4
select lname, COUNT(*) as titles from locatedAt GROUP BY lname;


-- question 6
delimiter |
create trigger author_insert after insert on Author 
for each row begin insert into 
Audit(table_name, action_value, dt) values ('Author', 'INSERT', NOW()); 
end;
|
create trigger add_book after insert on locatedAt 
for each row begin  
insert into Audit(table_name, action_value, dt) values ('locatedAt', 'INSERT', NOW()); 
end;
|
create trigger delete_book after DELETE on locatedAt for each row begin insert into Audit(table_name, action_value, dt) values('locatedAt', 'DELETE', NOW()); end;|

create trigger update_copy after UPDATE on locatedAt for each row begin insert into Audit(table_name,action_value, dt) values ('locatedAt', 'UPDATE', NOW()); end;|

delimiter ;
-- question 7
-- DROP VIEW IF EXISTS book_author_library;
CREATE SQL SECURITY INVOKER VIEW book_a_l
AS SELECT Title,
GROUP_CONCAT(first_name, ' ', last_name SEPARATOR ', ') AS authors,
lname
FROM Book b, WrittenBy ab, Author a, locatedAt lb
where ab.AuthorID = a.AuthorID
and lb.ISBN = ab.ISBN
and ab.ISBN = b.ISBN
and lb.ISBN = b.ISBN
GROUP BY Title, lname;





-- question 8
select a.Title, a.authors, lb.shelf, a.lname 
 from locatedAt lb ,( select bal.Title, bal.authors, bal.lname, b.ISBN 
 from book_a_l as bal, Book as b where bal.Title = b.Title ) 
 AS a where lb.ISBN = a.ISBN  and lb.lname = a.lname ORDER BY Title;

