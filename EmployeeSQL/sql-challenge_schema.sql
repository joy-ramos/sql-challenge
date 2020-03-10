CREATE TABLE "employees" (
  "emp_no" int UNIQUE PRIMARY KEY NOT NULL,
  "first_name" varchar(255) NOT NULL,
  "last_name" varchar(255) NOT NULL,
  "gender" varchar(1),
  "birth_date" date,
  "hire_date" date
);

CREATE TABLE "titles" (
  "id" SERIAL PRIMARY KEY,
  "emp_no" int NOT NULL,
  "title" varchar(255) NOT NULL,
  "from_date" date,
  "to_date" date
);

CREATE TABLE "salaries" (
  "id" SERIAL,
  "emp_no" int,
  "salary" float NOT NULL,
  "from_date" date,
  "to_date" date,
  PRIMARY KEY ("id", "emp_no")
);

CREATE TABLE "departments" (
  "dept_no" varchar(255) PRIMARY KEY NOT NULL,
  "dept_name" varchar(255) NOT NULL
);

CREATE TABLE "dept_manager" (
  "id" SERIAL PRIMARY KEY,
  "dept_no" varchar(255),
  "emp_no" int,
  "from_date" date,
  "to_date" date
);

CREATE TABLE "dept_emp" (
  "id" SERIAL,
  "emp_no" int NOT NULL,
  "dept_no" varchar(255),
  "from_date" date,
  "to_date" date,
  PRIMARY KEY ("id", "emp_no", "dept_no")
);

ALTER TABLE "titles" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

