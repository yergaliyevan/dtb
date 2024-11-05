create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
create table departments(
    departments_id serial primary key,
    department_name varchar(50) unique ,
    budget integer,
    location_id integer references locations
);
create table employees(
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);
select e.first_name,e.last_name, e.department_id, d.department_name from employees e
join departments d on e.department_id = d.departments_id;

select e.first_name, e.last_name, e.department_id, d.department_name from employees e
join departments d on e.department_id = d.departments_id
where e.department_id in (80,40);

select e.first_name, e.last_name,e.department_id,d.department_name,l.city,l.state_province from employees e
join departments d on e.department_id = d.departments_id
join locations l on d.location_id = l.location_id;

select d.department_name, e.department_id, e.first_name, e.last_name from departments d
left join employees e on d.departments_id = e.department_id;

select d.department_name, e.department_id, e.first_name, e.last_name from employees e
left join departments d on d.departments_id = e.department_id;

