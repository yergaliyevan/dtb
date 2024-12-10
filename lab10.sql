create table Books(
    book_id serial primary key,
    title varchar,
    author varchar,
    price decimal,
    quantity integer
);
create table Orders(
    order_id serial primary key ,
    book_id integer references Books(book_id),
    customer_id integer,
    order_date date,
    quantity integer
);
create table Customers(
    customer_id integer primary key,
    name varchar,
    email varchar
);
insert into Books (title, author,price,quantity) values
('Database 101','A.Smith',40.00,10),
('Learn Sql','B.Johnson',35.00,15),
('Advanced DB','C.lee',50.00,5);
insert into Customers(customer_id, name, email) values
(101,'John Doe','johndoe@gmail.com'),
(102,'Jane Doe','janedoe@gmail.com');

begin;
insert into Orders (book_id, customer_id, order_date, quantity)
values (1, 101, current_date, 2);
update Books
set quantity = quantity - 2
where book_id = 1;
commit;

begin;
insert into Orders (book_id, customer_id, order_date, quantity)
values (3, 102, current_date, 10);
rollback;

begin transaction isolation level read committed;
update Books
set price = 45.00
where book_id = 1;

begin transaction isolation level read committed;
select price from Books
where book_id = 1;
commit;

begin;
update Customers
set email = 'newemail@gmqil.com'
where customer_id = 101;
commit;
select * from Customers where customer_id = 101;


