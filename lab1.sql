CREATE DATABASE lab1;
CREATE TABLE users(
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users ADD isadmin INT;

ALTER TABLE users ALTER COLUMN isadmin TYPE BOOLEAN;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD PRIMARY KEY(id);

select * from users;

CREATE TABLE tasks(
    id SERIAL,
    name VARCHAR(50),
    id_name INT
);

select *from tasks;

DROP TABLE tasks;
DROP DATABASE lab1;


