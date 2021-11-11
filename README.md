# Pewlett-Hackard-Analysis

## Overview of the Analysis

### Background
Pewlett Hackard is preparing for a large wave of retirements. They are seeking to use employee data to anticipate vacancies. HR is seeking information on who will be retiring and how many positions need to be filled. In this specific analysis, SQL was used first to identify employees retiring by title, and then second to identify employees who are eligible for a mentorship program.

## Results

###
* After employees who previously left the company are removed from the list, there are 72,458 employees who will be seeking retirement.
* Slightly over two-thirds of the staff retiring are at a senior level, with the following numbers:
  * 25,916 Senior Engineer 
  * 24,926 Senior Staff
* The remainder of retiring employees are split between five job titles, with the following numbers:
  * 9,285 Engineer
  * 7,636 Staff
  * 3,603 Technique Leader
  * 1,090 Assistant Engineer
  * 2 Manager
* There are 1,549 staff members eligible for a mentorship program, though this number is based solely on their age.

## Summary

### Silver Tsunami
There will be 72,458 roles that need filled to offset the retirement numbers. If Pewlett Hackard utilizes only employees born in 1965 for their mentorship program, each mentor would need to take-on about 47 mentees to fill these positions internally through promotion.

An additional helpful query looks which retiring employees worked has worked for the company more than 10 years. The latest hiring date in the data set is 08/01/2002, so if we go back and review retirees who were hired before 08/01/1992, that helps to identify core people who hold institutional knowledge that's essential for the success of a large organization. By modifying the code in this way, we can find there are 11,877 veteran employees retiring:
![Institutional_Knowledge](https://user-images.githubusercontent.com/24308495/141226050-b5dc91a4-420f-4cd2-a4e5-94b1fdb499db.PNG)

A query that may be helpful to the mentorship program would be to remove the age requirement, and instead focus on employees who have been with the organization for over 10 years. By changing the query so it assesses all employees born on or after 1956, and started prior to 08/01/1992, we find there 77,420 employees within this criteria:
![better_mentorship](https://user-images.githubusercontent.com/24308495/141227549-e44f683b-b72f-4422-87d9-5554849a62af.PNG)
