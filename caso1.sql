CREATE DATABASE workers;

CREATE TABLE department_table(
    id SERIAL,
    department_name VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE workers_table(
    id SERIAL,
    rut VARCHAR(50),
    address_worker VARCHAR(200),
    worker_name VARCHAR(50),
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department_table(id)
);

CREATE TABLE salaries_table(
    id SERIAL,
    worker_id INT,
    drive_file VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (worker_id) REFERENCES workers_table(id)
);

--solo para corroborar agrego datos falsos
--2 para department_table
INSERT INTO department_table (department_name) VALUES ('Contabilidad');
INSERT INTO department_table (department_name) VALUES ('Finanzas');

--2 para worker_table
INSERT INTO workers_table (rut, address_worker, worker_name, department_id) VALUES ('15000333-1', 'Nataniel Cox 500, Santiago', 'Sofia', 1);
INSERT INTO workers_table (rut, address_worker, worker_name, department_id) VALUES ('15000444-2', 'Colombia 54, La Florida', 'Pedro', 2);

--2 para salaries_table
INSERT INTO salaries_table (worker_id, drive_file) VALUES (1, 'Sueldo_enero_15000333-1');
INSERT INTO salaries_table (worker_id, drive_file) VALUES (2, 'Sueldo_enero_15000444-2');



