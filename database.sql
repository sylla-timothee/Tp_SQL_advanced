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

ALTER TABLE Employees ADD COLUMN Hire_date TEXT NOT NULL;
ALTER TABLE Dishes ADD COLUMN Is_vegan TEXT;
ALTER TABLE Orders RENAME TO CustomerOrders;

