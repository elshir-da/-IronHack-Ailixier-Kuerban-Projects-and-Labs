CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;


DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
      id INT AUTO_INCREMENT PRIMARY KEY,
      vin VARCHAR(17) NOT NULL,
      manufacturer VARCHAR(50) NOT NULL,
      model VARCHAR(30) NOT NULL,
      year INT NOT NULL,
      color VARCHAR(30) NOT NULL
);      

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
      id INT AUTO_INCREMENT PRIMARY KEY,
      cust_id INT,
      cust_name VARCHAR(50) NOT NULL,
      cust_phone VARCHAR(30) NOT NULL,
      cust_email VARCHAR(50),
      cust_address VARCHAR(100),
      cust_city VARCHAR(30) NOT NULL,
      cust_state VARCHAR(30) NOT NULL,
      cust_country VARCHAR(30) NOT NULL,
      cust_zipcode VARCHAR(20)
);
      
DROP TABLE IF EXISTS salespersons;
CREATE TABLE salespersons (
      id INT AUTO_INCREMENT PRIMARY KEY,
      staff_id INT,
      name VARCHAR(50) NOT NULL,
      store VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
      id INT AUTO_INCREMENT PRIMARY KEY,
      invoice_number INT,
      date DATETIME,
      car INT,
      customer INT,
      salesperson INT
);

