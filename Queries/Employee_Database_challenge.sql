--*************************************************************************
-------------------------------DELIVERABLE 1-------------------------------
--*************************************************************************

--DROP TABLE retirement_titles;
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
--Retrieve the title, from_date, and to_date columns from the Titles table.
	t.title,
	t.from_date,
	t.to_date
--Create a new table using the INTO clause.
INTO retirement_titles
--Join both tables on the primary key.
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01') --Shout out to Katey Harris for this improvement.
ORDER BY emp_no ASC;
--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.



--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--SELECT MAX(from_date),
--	emp_no,
--	first_name,
--	last_name,
--	title
--FROM retirement_titles
--GROUP BY emp_no;

--Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
--SELECT DISTINCT ON (______) _____,
--______,
--______,
--______

--INTO nameyourtable
--FROM _______
--ORDER BY _____, _____ DESC;

--SELECT * FROM retirement_titles;

--DROP TABLE unique_titles;
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.
--Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) (title),
first_name,
last_name,
emp_no
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.
--Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc;


--*************************************************************************
-------------------------------DELIVERABLE 2-------------------------------
--*************************************************************************

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.birth_date,
	e.first_name,
	e.last_name,
--Retrieve the from_date and to_date columns from the Department Employee table.
	de.from_date,
	de.to_date,
--Retrieve the title column from the Titles table.
	t.title
--Create a new table using the INTO clause.
INTO mentorship_eligibility
FROM employees AS e
--Join the Employees and the Department Employee tables on the primary key.
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
--Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
--Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
--Order the table by the employee number.
ORDER BY emp_no ASC;
