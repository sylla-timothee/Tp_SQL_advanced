/* Create initial tables */
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Restaurants (
    IdRestaurant INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Planet TEXT NOT NULL,
    Opening_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees (
    IdEmployees INTEGER PRIMARY KEY,
    Firstname TEXT NOT NULL,
    Lastname TEXT NOT NULL,
    Role TEXT NOT NULL,
    IdRestaurant INTEGER,
    FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

CREATE TABLE IF NOT EXISTS Dishes (
    IdDishes INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Price INTEGER NOT NULL,
    Category TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Orders (
    IdOrders INTEGER PRIMARY KEY,
    IdRestaurant INTEGER NOT NULL,
    Total_amount INTEGER NOT NULL,
    Customer_name TEXT NOT NULL,
    FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

CREATE TABLE IF NOT EXISTS OrderItems (
    IdOrderItems INTEGER PRIMARY KEY,
    IdOrders INTEGER NOT NULL,
    IdDishes INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    FOREIGN KEY (IdOrders) REFERENCES Orders(IdOrders),
    FOREIGN KEY (IdDishes) REFERENCES Dishes(IdDishes)
);

/* Required modifications */
ALTER TABLE Employees ADD COLUMN Hire_date TEXT NOT NULL;
ALTER TABLE Dishes ADD COLUMN Is_vegan BOOLEAN;
ALTER TABLE Orders RENAME TO CustomerOrders;

/* Insert data into the tables */
INSERT INTO Restaurants (IdRestaurant, Name, Planet, Opening_year) 
    VALUES
        (1, 'The Pizza Place', 'Earth', 2020),
        (2, 'The Burger Place', 'Mars', 2021),
        (3, 'The Ice Cream Place', 'Venus', 2022),
        (4, 'The Hot Dog Place', 'Mercury', 2023),
        (5, 'The Taco Place', 'Jupiter', 2024),
        (6, 'The Sushi Place', 'Saturn', 2025),
        (7, 'The Ramen Place', 'Uranus', 2026),
        (8, 'The Pizza Place', 'Neptune', 2027),
        (9, 'The Burger Place', 'Pluto', 2028),
        (10, 'The Ice Cream Place', 'Neptune', 2029);

INSERT INTO Dishes (IdDishes, Name, Price, Category, Is_vegan)
    VALUES
        (1, 'Margerita', 6.50, 'Pizza', True),
        (2, 'Capricciosa', 7.50, 'Pizza', True),
        (3, 'Regina', 9, 'Pizza', NULL),
        (4, 'New Yorker', 8, 'Burger', NULL),
        (5, 'Chicken', 5, 'Burger', NULL),
        (6, 'Miso Ramen', 10, 'Ramen', True),
        (7, 'Shoyu Ramen', 10, 'Ramen', NULL);

INSERT INTO Employees (IdEmployees, Firstname, Lastname, Role, IdRestaurant, Hire_date)
    VALUES
        (1, 'John', 'Doe', 'Manager', 1, '2020-01-01'),
        (2, 'Jane', 'Doe', 'Manager', 2, '2021-01-01'),
        (3, 'Bob', 'Smith', 'Manager', 3, '2022-01-01'),
        (4, 'Alice', 'Smith', 'Manager', 4, '2023-01-01'),
        (5, 'Bob', 'Smith', 'Manager', 5, '2024-01-01'),
        (6, 'Alice', 'Smith', 'Manager', 6, NULL),
        (7, 'Bob', 'Smith', 'Manager', 7, '2026-01-01'),
        (8, 'Alice', 'Smith', 'Manager', 8, '2027-01-01'),
        (9, 'Bob', 'Smith', 'Manager', 9, '2028-01-01'),
        (10, 'Alice', 'Smith', 'Manager', 10, NULL),
        (11, 'John', 'Doe', 'Employee', 1, '2020-01-01'),
        (12, 'Jane', 'Doe', 'Employee', 2, '2021-01-01'),
        (13, 'Bob', 'Smith', 'Employee', 3, '2022-01-01'),
        (14, 'Alice', 'Smith', 'Employee', 4, '2023-01-01'),
        (15, 'Bob', 'Smith', 'Employee', 5, '2024-01-01'),
        (16, 'Alice', 'Smith', 'Employee', 6, '2025-01-01'),
        (17, 'Bob', 'Smith', 'Employee', 7, '2026-01-01'),
        (18, 'Alice', 'Smith', 'Employee', 8, '2027-01-01'),
        (19, 'Bob', 'Smith', 'Employee', 9, '2028-01-01'),
        (20, 'Alice', 'Smith', 'Employee', 10, '2029-01-01'),
        (21, 'John', 'Doe', 'Employee', 1, NULL),
        (22, 'Jane', 'Doe', 'Employee', 2, '2021-01-01'),
        (23, 'Bob', 'Smith', 'Employee', 3, '2022-01-01'),
        (24, 'Alice', 'Smith', 'Employee', 4, '2023-01-01'),
        (25, 'Bob', 'Smith', 'Employee', 5, '2024-01-01'),
        (26, 'Alice', 'Smith', 'Employee', 6, '2025-01-01'),
        (27, 'Bob', 'Smith', 'Employee', 7, '2026-01-01'),
        (28, 'Alice', 'Smith', 'Employee', 8, '2027-01-01'),
        (29, 'Bob', 'Smith', 'Employee', 9, NULL),
        (30, 'Alice', 'Smith', 'Employee', 10, '2029-01-01');

SELECT * FROM Restaurants;
SELECT * FROM Dishes ORDER BY Price DESC;
SELECT * FROM Employees ORDER BY Role;
SELECT * FROM Dishes WHERE Is_vegan = True;
SELECT * FROM Dishes WHERE Price > (SELECT AVG(Price) FROM Dishes);

SELECT * FROM Dishes WHERE Is_vegan IS NULL;
SELECT * FROM Employees WHERE Hire_date IS NULL;