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
        (1, 'John', 'Doe', 'Chef', 1, '2020-01-15'),
        (2, 'Jane', 'Smith', 'Waiter', 2, '2021-03-22'),
        (3, 'Emily', 'Johnson', 'Manager', 3, NULL),
        (4, 'Michael', 'Brown', 'Chef', 4, '2023-07-30'),
        (5, 'Sarah', 'Davis', 'Waiter', 5, NULL);

/* SELECT NULL */
SELECT * FROM Dishes WHERE Is_vegan == NULL;
SELECT * FROM Employees WHERE Hire_date == NULL;

/* Commands gestions*/
/*Make Commands*/
INSERT INTO CustomerOrders (IdOrders, IdRestaurant, Total_amount, Customer_name)
    VALUES
        (1, 3, 2, 'Luke Skywalker'),
        (2, 1, 3, 'Hann Solo'),
        (3, 5, 10, 'Chewbacca');

/*Add OrderItems commands, and calculate total command and price*/
INSERT INTO OrderItems (IdOrderItems, IdOrders, IdDishes, Quantity)
    VALUES
        (1, 1, 1, 2),
        (2, 2, 3, 1),
        (3, 3, 5, 20);

SELECT 
    SUM(oi.Quantity) AS total_dishes_ordered,
    SUM(oi.Quantity * d.Price) AS total_price
FROM CustomerOrders CO
JOIN OrderItems oi ON co.IdOrders = oi.IdOrders
JOIN Dishes d ON oi.IdDishes = d.IdDishes;


/*Update */

SELECT IdDishes, Name, Price
FROM Dishes
WHERE Price > 12;
UPDATE Dishes
SET Price = Price * 0.9
WHERE Price > 12;

SELECT IdDishes, Name, Price
FROM Dishes
WHERE Price < 12; 
UPDATE Dishes
SET Price = Price * 0.95
WHERE Price < 12;
