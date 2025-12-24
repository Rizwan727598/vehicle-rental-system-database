# Vehicle Rental System – Database Design & SQL Queries

## Project Overview

The **Vehicle Rental System** manages rentals by tracking **users**, **vehicles**, and **bookings**. The project focuses on:

- **Database Design**: Structuring tables to manage users, vehicles, and bookings.
- **ERD Modeling**: Creating an Entity-Relationship Diagram (ERD) to visualize the relationships.
- **SQL Queries**: Implementing SQL queries to interact with the database.

## Key Features

- **Users Table**: Manages information for both customers and admins.
- **Vehicles Table**: Stores details about the available vehicles for rent.
- **Bookings Table**: Tracks the details of rental bookings made by users.

## Database Schema

### 1. Users Table

- **Fields**: `user_id`, `email`, `role (Admin/Customer)`
- **Purpose**: Stores details about customers and admins.

### 2. Vehicles Table

- **Fields**: `vehicle_id`, `registration_number`, `availability_status`
- **Purpose**: Stores information about vehicles available for rent.

### 3. Bookings Table

- **Fields**: `booking_id`, `user_id` (FK), `vehicle_id` (FK), `start_date`, `end_date`, `total_cost`
- **Purpose**: Tracks booking details, linking users with vehicles.

## Relationships Between Tables

- **User → Bookings**: A user can have many bookings.
- **Vehicle → Bookings**: A vehicle can have many bookings.
- **Booking → User & Vehicle**: Each booking is linked to exactly one user and one vehicle.

## ERD Design

The **Entity Relationship Diagram (ERD)** shows the relationships between the tables, highlighting:

- **Primary Keys (PK)**: Unique identifiers for each record.
- **Foreign Keys (FK)**: Ensure the integrity of relationships between tables.
- **Cardinality**: Defines the relationships (One-to-Many, Many-to-One, etc.)

**View the ERD**: [Lucidchart ERD Link](https://lucid.app/lucidchart/15aa563a-37d7-4580-a2d6-5cb6f9c0d213/edit?invitationId=inv_9ad4376b-19ea-47e1-8b9c-3d11174dc387)

## SQL Queries

### Query 1: Retrieve Booking Information with Customer and Vehicle Names

- **Purpose**: Join the `Bookings`, `Users`, and `Vehicles` tables to retrieve detailed booking information, including customer and vehicle names.

### Query 2: Find Vehicles That Have Never Been Booked

- **Purpose**: Use the `NOT EXISTS` clause to find vehicles that do not have any associated bookings.

### Query 3: Retrieve Available Vehicles of a Specific Type (e.g., Cars)

- **Purpose**: Filter vehicles by type and availability status (e.g., retrieving only available cars).

### Query 4: Find Vehicles with More Than 2 Bookings

- **Purpose**: Use `GROUP BY` and `HAVING` to count the number of bookings per vehicle and retrieve those with more than two bookings.

## Tools Used

- **SQL**: Standard SQL for creating tables and queries.
- **Lucidchart**: Used to design the **ERD**.

## Design and Implementation Notes

- **Data Integrity**: Enforced through **Primary Keys** and **Foreign Keys**.
- **Monetary Values**: Stored using `DECIMAL(10, 2)` for precise calculations.
- **Constraints**: Unique constraints for email addresses and vehicle registration numbers to prevent duplicates.

## Conclusion

This project demonstrates how to structure and query a **Vehicle Rental System** database. By managing users, vehicles, and bookings, the system tracks rental operations while ensuring data consistency and integrity.

Feel free to reach out if you have any questions.
