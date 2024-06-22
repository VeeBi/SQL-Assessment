USE LIBRARY;
CREATE TABLE IF NOT EXISTS Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
    
);
 

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '123-456-7890'),
(2, 102, '456 Elm St', '987-654-3210'),
(3, 103, '789 Oak St', '321-654-0987'),
(4,104,'989 Vis gh', '421-545-2354'),
(5,105,'565 JKJ','254-125-5036'),
(6,106,'854 LFD','852-457-8097'),
(7,107,'568 RTG','457-872-8915'),
(8,108,'235 SDA','845-327-7089'),
(9,109,'452 ASE','654-754-1023'),
(10,110,'521 DEF','352-154-2036'),
(11,111,'452 KLN',235-789-4562),
(12,112,'235 NMN','785-254-6321'),
(13,113,'785 HND','235-784-2351');

CREATE TABLE IF NOT EXISTS Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Manager', 50000, 1),
(202, 'Jane Smith', 'Clerk', 35000, 1),
(203, 'Alice Johnson', 'Librarian', 40000, 2),
(204, 'Bob Williams', 'Assistant Librarian', 30000, 2),
(205, 'Michael Brown', 'Clerk', 32000, 3),
(206, 'Emily Jones', 'Assistant Librarian', 28000, 3),
(207, 'Veena', 'Engineer', 80000, '1'),
(208,'Asin','Engineer',95000,4),
(209,'Thomas','Clerk',40000,5),
(210,'Clarret','Accountant',25000,6),
(211,'Geetha','Clerk',40000,1),
(212,'Deepu','Peon',25000,1),
(213,'Sudha','Auditor',90000,1);

CREATE TABLE IF NOT EXISTS Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978', 'To Kill a Mockingbird', 'Fiction', 10.99, 'yes', 'Harper Lee', 'HarperCollins'),
('979', 'Harry Potter and the Philosopher\'s Stone', 'Fantasy', 12.99, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('980', 'The Catcher in the Rye', 'Fiction', 9.99, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('981','Modern History','History',10.09,'yes','Bipin Chandra','Orient Black Swan'),
('982','Ancient History','History','15.12','yes',' Upinder Singh','Pearson'),
('983','Talkative Man','Novel','30','yes','R K Narayan','Heinemann'),
('984','I had a Love story','Novel','26.02','yes','Ravinder Singh','Penguin'),
(985,'Alchemist','Fantasy Fiction',28.7,'yes','Paulo Cheolo','Humanitas Fiction');

CREATE TABLE IF NOT EXISTS Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Alice Green', '123 Maple St', '2020-01-15'),
(302, 'Bob Black', '456 Pine St', '2024-02-20'),
(303, 'Charlie Brown', '789 Cedar St', '2024-03-25'),
('304','Veena', 'layout1', '2021-12-31'),
('305','Lipisha', 'KK road 2', '2021-12-30'),
('306','Devan', 'KK road 3', '2023-6-30'),
('307','Appu','VIS road','2023-6-15');




UPDATE Customer
SET Reg_date = '2020-01-15'
WHERE Customer_Id = '301';

CREATE TABLE IF NOT EXISTS IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(401, 301, 'To Kill a Mockingbird', '2024-05-01', '978'),
(402, 302, 'Harry Potter and the Philosopher\'s Stone', '2024-05-05', '979'),
(403, 303, 'The Catcher in the Rye', '2024-05-10', '980'),
(404, 304, 'Talkative Man', '2022-03-05', '983'),
(405, 305, 'Alchemist','2023-02-10', '985'),
(406,306,'Buried Thoughts','2023-06-01','981');
 
UPDATE IssueStatus 
SET Issue_date = '2020-05-01'
WHERE Issue_Id = '401';

UPDATE IssueStatus 
SET Issue_date = '2023-06-09'
WHERE Issue_Id = '403';

CREATE TABLE IF NOT EXISTS ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'To Kill a Mockingbird', '2024-06-01', '978'),
(502, 302, 'Harry Potter and the Philosopher\'s Stone', '2024-06-05', '979'),
(503, 303, 'The Catcher in the Rye', '2024-06-10', '980');

 -- 1. Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
INNER JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
INNER JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE YEAR(IssueStatus.Issue_date) = 2023 AND MONTH(IssueStatus.Issue_date) = 6;

-- 9. Retrieve book_title from book table containing history. 
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT Employee.Emp_name, Branch.Branch_address 
FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id; 

-- 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;





