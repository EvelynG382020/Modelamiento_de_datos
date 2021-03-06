CREATE DATABASE califications;
\c calification

CREATE TABLE class_table(
    id SERIAL,
    class_name VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE students_table(
    id SERIAL,
    rut VARCHAR (10),
    student_name VARCHAR(40),
    id_class INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_class) REFERENCES class_table(id)
);

CREATE TABLE teacher_department_table(
    id SERIAL,
    department_name VARCHAR(40),
    PRIMARY KEY (id)
);

CREATE TABLE teacher_table(
    id SERIAL,
    teacher_name VARCHAR (40),
    id_department INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_department) REFERENCES teacher_department_table(id)
);

CREATE TABLE test_table(
    id_test SERIAL,
    calification INT,
    id_student INT,
    id_teacher_evaluator INT,
    PRIMARY KEY (id_test),
    FOREIGN KEY (id_student) REFERENCES students_table(id),
    FOREIGN key (id_teacher_evaluator) REFERENCES teacher_table(id)
);

--Agregamos datos a las tablas para probar 
--3 registros a tabla curso, class_table
INSERT INTO class_table (class_name) VALUES ('2º medio B');
INSERT INTO class_table (class_name) VALUES ('1º medio A');
INSERT INTO class_table (class_name) VALUES ('5º basico B');

--3 registros a tabla de estudianes, students_table
INSERT INTO students_table (rut, student_name, id_class) VALUES ('24000000-1', 'Francisca', 1);
INSERT INTO students_table (rut, student_name, id_class) VALUES ('24000000-2', 'Claudia', 1);
INSERT INTO students_table (rut, student_name, id_class) VALUES ('24000000-3', 'Rodrigo', 1);

--3 registros a la tabla del depto de profesores, teacher_department_table
INSERT INTO teacher_department_table (department_name) VALUES ('Matematicas');
INSERT INTO teacher_department_table (department_name) VALUES ('Lenguaje');
INSERT INTO teacher_department_table (department_name) VALUES ('Historia');

--3 registros tabla de profesores, teacher_table
INSERT INTO teacher_table (teacher_name, id_department) VALUES ('Matías', 1);
INSERT INTO teacher_table (teacher_name, id_department) VALUES ('Consuelo', 2);
INSERT INTO teacher_table (teacher_name, id_department) VALUES ('Evelyn', 3);

--3 registros tabla pruebas, test_table
INSERT INTO test_table (calification, id_student, id_teacher_evaluator) VALUES (7, 1, 1);
INSERT INTO test_table (calification, id_student, id_teacher_evaluator) VALUES (5, 1, 1);
INSERT INTO test_table (calification, id_student, id_teacher_evaluator) VALUES (6, 2, 3);

--verificar las tablas
SELECT * FROM teacher_department_table;
SELECT * FROM teacher_table;
SELECT * FROM test_table;
SELECT * FROM students_table;
SELECT * FROM class_table;