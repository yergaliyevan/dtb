create table Warehouses(
 code integer primary key,
 location varchar(255) not null,
 capacity integer not null
);

create table Boxes(
 code char(4) primary key ,
 contents varchar(255) not null,
 value real not null,
 warehouse integer not null
);

insert into Warehouses(code,location,capacity) values (1,'Chicago',3);
insert into Warehouses(code,location,capacity) values (2,'Chicago',4);
insert into Warehouses(code,location,capacity) values (3,'New York',7);
insert into Warehouses(code,location,capacity) values (4,'Los Angeles',2);
insert into Warehouses(code,location,capacity) values (5,'San Francisco',8);

insert into Boxes(code,contents,value,warehouse) values('0MN7','Rocks',180,3);
insert into Boxes(code,contents,value,warehouse) values('4H8P','Rocks',250,1);
insert into Boxes(code,contents,value,warehouse) values('4RT3','Scissors',190,4);
insert into Boxes(code,contents,value,warehouse) values('7G3H','Rocks',200,1);
insert into Boxes(code,contents,value,warehouse) values('8JN6','Papers',75,1);
insert into Boxes(code,contents,value,warehouse) values('8Y6U','Papers',50,3);
insert into Boxes(code,contents,value,warehouse) values('9J6F','Papers',175,2);
insert into Boxes(code,contents,value,warehouse) values('LL08','Rocks',140,4);
insert into Boxes(code,contents,value,warehouse) values('P0H6','Scissors',125,1);
insert into Boxes(code,contents,value,warehouse) values('P2T6','Scissors',150,2);
insert into Boxes(code,contents,value,warehouse) values('TU55','Papers',90,5);

select * from Warehouses;
select * from Boxes;
select * from Boxes where value>150;

select distinct contents from Boxes;

select warehouse,  count(code) as box_numb
from Boxes group by warehouse;

select warehouse, count(code) as box_numb
from Boxes group by warehouse having count(code) > 2;

insert into Warehouses(code,location,capacity) values (6,'New York',3);
insert into Boxes(code,contents,value,warehouse) values ('H5RT','papers',200,2);

update Boxes set value = value * 0.85
where code = (
    select code from Boxes
    order by value desc
    limit 1 offset 2
);

delete from boxes where value< 150;

delete from Boxes using  Warehouses
where Boxes.warehouse = Warehouses.code
and Warehouses.location = 'New York'
returning Boxes.*;

