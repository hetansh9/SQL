-- Question 5 
select*from Book;
select*from Member;
select*from Author;
select*from Publisher;
select*from Phone;

-- Question 6 

select*from BorrowedBy;
select*from WrittenBy;
select*from authorPhone;
select*from publisherPhone;

-- Question 7 

select first_name , last_name from Member where last_name LIKE 'B%';

-- Question 8 
select Title from Book where PubID = 10002 ORDER BY Title;

-- Question 9 
select y.ISBN, b.Title from Book b, Member m, BorrowedBy y where m.MemberID = y.MemberID AND b.ISBN = y.ISBN AND y.checkin_date IS NULL;


-- Question 10 

select b.Title from Book b, Author a, WrittenBy w  where a.AuthorID = w.AuthorID AND w.ISBN = b.ISBN;

-- Question 11 

select a.first_name, a.last_name, ap.PNumber from Author a, authorPhone ap, authorPhone p  where  ap.PNumber = p.PNumber AND ap.AuthorID != p.AuthorID AND a.AuthorID = ap.AuthorID;
