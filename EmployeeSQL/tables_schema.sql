--drop table salaries;
--drop table dept_manager;
--drop table dept_emp;
--drop table departments;
--drop table employees;

CREATE TABLE "employees" (
    "emp_no" int,
    "emp_title" varchar,
    "birth_date" date,
    "first_name" varchar,
    "last_name" varchar,
    "sex" varchar ,
    "hire_date" date,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
	)
);

CREATE TABLE "departments" (
    "dept_no" varchar,
    "dept_name" varchar,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int,
    "salary" int,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar,
    "emp_no" int,
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" int,
    "dept_no" varchar,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no")
);