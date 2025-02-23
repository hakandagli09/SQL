USE new_ClassicModels;  /* The database to be used for this assignment. It differs from the database provided
						   on the text's website due to differences in the MySQL server versions.*/

Show tables;   /* Provides a list of tables in the new_ClassicModels database. 
				If you want to see the column names, data types, and other contraints 
                like if the values can be Null or the key is Primary then type the following 
                as code:    Describe insert_table_name  e.g. Describe offices*/

Describe offices;

/*1.	Prepare a list of offices sorted by country, state, city.*/
SELECT country, state, city
	FROM offices
		ORDER BY country, state, city;

/*2.	How many employees are there in the company?*/
SELECT count(employeeNumber)
	FROM employees;
 
/*3.	What is the total of payments received?*/

SELECT CONCAT('$', FORMAT(sum(amount),2)) AS 'Value of Total Payments'
	FROM Payments;
 

/*4.	List the product lines that contain 'Cars'.*/
SELECT productLine
	FROM productlines
		WHERE productLine LIKE '%Cars';

 

/*5.	Report total payments for October 28, 2004.*/
SELECT CONCAT('$', FORMAT(sum(amount),2)) AS 'Payments for October 28, 2004'
	FROM Payments
		WHERE paymentdate = '2004-10-28';
 
/*6.	Report those payments greater than $100,000.*/
SELECT CONCAT('$', FORMAT((amount),2)) AS 'Payments over $100,000'
	FROM Payments
		WHERE amount > 100000
			ORDER BY amount DESC;
 
/*7.	List the products in each product line.*/
SELECT productline, productname
	FROM products
		ORDER BY productline, productname;
 
/*8.	How many products in each product line?*/
SELECT productline AS 'Product Line Type', count(quantityinstock) AS 'Number of Products Per Line Type'
	FROM products
		GROUP BY productline
			ORDER BY productline;

 
/*9.	What is the minimum payment received?*/
SELECT CONCAT('$', FORMAT(min(amount),2)) AS 'Minimum Payment Amount Received'
	FROM payments;
 
/*10.	List all payments greater than twice the average payment. (HINT: ROUND keeps the amount as a number, which allows for ORDER BY to be used.)*/ 
SELECT CONCAT('$',ROUND(amount,2)) as 'Payments greater than twice the average received'
	FROM payments
		WHERE amount > 2 * (SELECT avg(amount) FROM payments)
			ORDER BY amount;
 
/*11.	What is the average percentage markup of the MSRP on buyPrice?*/
SELECT concat(FORMAT(avg(MSRP/BUYPrice)*100-100,2),'%') AS 'Average Percent Markup'
	FROM products;
		

 
/*12.	How many distinct products does ClassicModels sell*/

SELECT COUNT(productcode) AS 'Different Product Codes'
	FROM products;

 
/*13.	Report the name and city of customers who don't have sales representatives?*/

SELECT city AS "Customer's City", customername AS "Customer's Name", salesrepemployeenumber AS "Needs Sales Rep"
	FROM customers
		WHERE salesrepemployeenumber is NULL
			ORDER BY city;
 
/*14.	What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.*/
SELECT CONCAT(firstname,' ', lastname) AS 'VPs and Managers', Jobtitle as "Job Title"
	FROM employees
		WHERE jobtitle LIKE '%VP%' OR jobtitle LIKE "%Manager%";

 
 

/*15.	Which orders have a value greater than $5,000?*/
SELECT ordernumber AS 'Order Number', CONCAT('$',FORMAT(sum(priceeach*quantityordered), 2)) as 'Order Value'
	FROM orderdetails
		GROUP BY ordernumber
			HAVING sum(priceeach*quantityordered) > 5000
				ORDER BY orderNumber;

			


