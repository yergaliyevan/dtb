create table departments(
    departments_id serial primary key,
    department_name varchar(50) unique ,
    budget integer
);
create table employees(
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references Departments);
create table countries (
    id serial primary key,
    name varchar(255) not null,
    population int,
    area float
);

create index idx_countries_name on countries (name);

create index idx_employees_name_surname on employees (first_name,last_name);

create unique index idx_employees_salary_range on employees (salary);

create index idx_employees_name_substring on employees (substring(first_name from 1 for 4));

create index idx_employees_departments on employees (department_id);
create index idx_departments_budget on departments (budget);

