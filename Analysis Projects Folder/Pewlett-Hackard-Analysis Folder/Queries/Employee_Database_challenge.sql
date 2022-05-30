-- Retrieve Employees table data
SELECT e.emp_no, 
e.first_name,  
e.last_name
FROM employees as e;

--Retrieve Titles table data
SELECT title,
from_date,
to_date
FROM titles;

SELECT e.emp_no,
     e.first_name,
     e.last_name,
	 titles.title,
	 titles.from_date,
     titles.to_date
INTO retirement_titles
FROM titles 
INNER JOIN employees as e
ON titles.emp_no = e.emp_no 
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
;
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
		first_name,
		last_name,
		title

INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.from_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

--Check Tables
SELECT * FROM unique_titles 
SELECT * FROM mentorship_eligibilty

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles GROUP BY title ORDER BY COUNT DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM Employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01'
and e.birth_date between '1965-01-01' and '1965-12-31'
ORDER BY e.emp_no;

SELECT COUNT(*) FROM mentorship_eligibilty
SELECT COUNT(*) FROM unique_titles

