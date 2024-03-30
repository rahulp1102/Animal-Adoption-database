# Animal Shelter Database Project

This repository contains the core data and SQL scripts related to the operation of an animal shelter.

## Data Files (CSV)

* **Admin.csv:** Contains administrative user data including usernames, passwords, and names.
* **Animal.csv:** Stores information about animals available for adoption (ID, type, name, breed, description, etc.).
* **ContactusMessage.csv:** Records messages and inquiries sent through the "Contact Us" form on the shelter's website.
* **History.csv:** Tracks the history of adoption requests, including the request ID, usernames, animal details, dates, and adoption status.
* **User.csv:** Contains general user data (username, name, email, etc.).
* **Vet_Record.csv:** Stores veterinary records for animals, including dates, vet names, and procedures.
* **Volunteer.csv:**  Contains volunteer profiles (name, contact information, availability).
* **Donation.csv:** Records donations made to the shelter, including dates, amounts, and donor information (if provided).
* **Request.csv:** Contains adoption requests, including details about the animal requested and the user's survey answers.

## SQL Files

* **Database.sql:** Contains the SQL commands to create the database structure, including all necessary tables and relationships.
* **Tables.sql:** (Optional) Includes SQL commands for creating the tables individually if a separate file is desired.
* **Queries_Questions.sql:** Contains a collection of SQL queries that can be used to analyze the data, answer questions about shelter operations, and gain insights.

## How to Use

1. **Set up Database:**
    *   Import 'Database.sql' (or 'Tables.sql') into your database management system to create the database structure.
    *   Import the CSV files into their corresponding database tables.

2. **Explore Queries:**
    *   Run the queries in 'Queries_Questions.sql' to explore the data, find adoption trends, analyze donations, and understand shelter operations.

## Important Notes

* **Sensitive Data:** This dataset may contain sample data. Please handle any real data with care and ensure adherence to privacy regulations.
* **Database System:** This project assumes the use of a specific database system (MySQL, PostgreSQL, etc.). Please adjust SQL scripts if needed. 

## Feedback and Contributions

This is an ongoing project. If you have suggestions for improvement, additional queries, or other contributions, feel free to open an issue or submit a pull request. 
