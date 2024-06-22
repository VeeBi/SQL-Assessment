
CREATE TABLE IF NOT EXISTS Employees (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);


INSERT INTO Employees (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Manager', 50000, 1),
(202, 'Jane Smith', 'Clerk', 35000, 1),
(203, 'Alice Johnson', 'Librarian', 40000, 2),
(204, 'Bob Williams', 'Assistant Librarian', 30000, 2),
(205, 'Michael Brown', 'Clerk', 32000, 3),
(206, 'Emily Jones', 'Assistant Librarian', 28000, 3),
(207, 'David Lee', 'Engineer', 80000, 1),
(208, 'Sarah Connor', 'Technician', 45000, 1);

CREATE TABLE IF NOT EXISTS Branches (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
    
);

INSERT INTO Branches (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 201, '123 Main St', '123-456-7890'),
(2, 202, '456 Elm St', '987-654-3210'),
(3, 203, '789 Oak St', '321-654-0987'),
(4, 204, '101 Maple St', '456-789-0123'),
(5, 205, '202 Birch St', '654-321-0987'),
(6, 206, '303 Cedar St', '789-012-3456'),
(7, 207, '404 Pine St', '012-345-6789'),
(8, 208, '505 Spruce St', '987-012-3456');

SELECT Employees.Emp_name, Branches.Branch_address 
FROM Employees
JOIN Branches ON Employees.Emp_Id = Branches.Manager_Id; 


