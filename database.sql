CREATE TABLE Restaurants (
    IdRestaurant INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Planet VARCHAR(100) NOT NULL,
    Opening_year INT NOT NULL,
);

CREATE TABLE Employees (
    IdEmployees INT PRIMARY KEY,
    Firstname VARCHAR(100) NOT NULL,
    Lastname VARCHAR(100) NOT NULL,
    Role VARCHAR(100) NOT NULL,
    IdRestaurant INT EXTERNAL KEY REFERENCES Restaurants(IdRestaurant),
);

CREATE TABLE Dishes (
    IdDishes INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price INT NOT NULL,
    Category VARCHAR(100) NOT NULL,
);

CREATE TABLE Orders (
    IdOrders INT PRIMARY KEY,
    IdRestaurant INT EXTERNAL KEY REFERENCES Restaurants(IdRestaurant),
    Total_amount INT NOT NULL,
    Customer_name VARCHAR(100) NOT NULL,
);

CREATE TABLE OrderItems (
    IdOrderItems INT PRIMARY KEY,
    IdOrders INT EXTERNAL KEY REFERENCES Orders(IdOrders),
    IdDishes INT EXTERNAL KEY REFERENCES Dishes(IdDishes),
    Quantity INT NOT NULL,
)