-- Part 2: Table Section

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    role VARCHAR(10) CHECK (role IN ('Admin', 'Customer')) NOT NULL
);

CREATE TABLE Vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(10) CHECK (type IN ('car', 'bike', 'truck')) NOT NULL,
    model VARCHAR(255) NOT NULL,
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    rental_price DECIMAL(10, 2) NOT NULL,
    availability VARCHAR(20) CHECK (availability IN ('available', 'rented', 'maintenance')) NOT NULL
);

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')) NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- Query 1: Retrieve Booking Information with Customer and Vehicle Names
SELECT b.booking_id, 
       u.name AS customer_name, 
       v.name AS vehicle_name, 
       b.start_date, 
       b.end_date, 
       b.status
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Vehicles v ON b.vehicle_id = v.vehicle_id;

-- Query 2: Find Vehicles that Have Never Been Booked
SELECT v.vehicle_id, 
       v.name, 
       v.type, 
       v.model, 
       v.registration_number, 
       v.rental_price, 
       v.availability
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM Bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

-- Query 3: Retrieve Available Vehicles of a Specific Type (Cars)
SELECT vehicle_id, 
       name, 
       type, 
       model, 
       registration_number, 
       rental_price, 
       availability
FROM Vehicles
WHERE type = 'car' 
  AND availability = 'available';

-- Query 4: Find Vehicles with More Than 2 Bookings
SELECT v.name AS vehicle_name, 
       COUNT(b.booking_id) AS total_bookings
FROM Bookings b
INNER JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;
