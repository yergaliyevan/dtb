CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    region_id INTEGER,
    population INTEGER
);

insert into countries (country_name, region_id, population)
VALUES ('Kazakhstan', 1, 19000000);

insert into countries (country_id,country_name)
values(3,'China');

insert into countries (country_name,country_id,population)
values('France',null,25000000);

insert into countries (country_name,country_id,population)
values
('Malaysia',89,33000000),
('Poland',56,6000000),
('Thailand',78,5600000);
drop table countries;
alter table countries
alter column country_name set default 'Kazakhstan';

insert into countries(country_id,population)
values (5,9000000);

insert into countries default values;

create table countries_new(like countries including all);

select
    country_name,
    population * 1.10 AS "New Population"
from
    countries;

delete from countries
where population < 100000
returning *;

delete from countries_new
where country_id in (select  country_id from countries)
returning *;

delete from countries
returning *;