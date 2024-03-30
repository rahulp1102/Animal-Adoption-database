-- Questions that the users can ask---

-- How many animals are currently available for adoption? --
SELECT COUNT(*) AS id
FROM Animal;

-- How many adoption requests has each user submitted? --
SELECT Username, COUNT(*) AS Num_Requests
FROM Request
GROUP BY Username;

-- Which are the top requested Breeds? --
SELECT Breed, COUNT(*) AS Num_Requests
FROM Request 
JOIN Animal ON Request.Animal_ID = Animal.ID
GROUP BY Breed
ORDER BY Num_Requests DESC; 

-- Who are the top 5 donors --
SELECT Username, SUM(Amount) as Total_Donations
FROM Donation
GROUP BY Username
ORDER BY Total_Donations DESC
limit 5
;

-- Donation trends --
SELECT  MONTH(Date) AS Months, SUM(Amount) AS Monthly_Total
FROM Donation
GROUP BY  Months
ORDER BY  Months;

-- How many users indicated they would be adopting with their family? --
SELECT COUNT(*) AS Family_Adoptions
FROM Request
WHERE SurveyAnswer LIKE '%family%' OR SurveyAnswer LIKE '%children%' 
;

-- What percentage of adoption requests are successful --
SELECT 
    (COUNT(History.AdoptionDate) / COUNT(Request.ID)) * 100 AS Success_Percentage
FROM Request
JOIN History ON Request.ID = History.Request_ID; 

-- Which type of animal is most frequently available for adoption? --
SELECT  type, COUNT(*) AS Num_Available
FROM animal
GROUP BY Type
ORDER BY Num_Available DESC;

-- What are the top 5 most playful animal breeds based on their descriptions?
SELECT Breed, COUNT(*) AS Playful_Mentions
FROM Animal
WHERE Description LIKE '%energetic%' OR Description LIKE '%playful%' -- Add more keywords
GROUP BY Breed
ORDER BY Playful_Mentions DESC
LIMIT 5;

-- Animals with no Recorded Annual Checkup
SELECT ID, Name
FROM Animal
WHERE ID NOT IN ( 
    SELECT DISTINCT Animal_ID 
    FROM Vet_Record
    WHERE v_Procedure LIKE '%Annual Checkup%' 
); 

-- Highest Donation received by your Organization? 
Select Max(amount) as Highest_Donation
from Donation
;
-- Donors Who Are Both Adopters and Volunteers
SELECT * 
FROM Donation
WHERE Username IN (
    SELECT Username FROM History WHERE AdoptionDate IS NOT NULL
) AND Username IN ( 
    SELECT Username FROM Volunteer
);


-- Adopters by City
SELECT City, COUNT(*) AS Adopter_Count
FROM User 
JOIN History ON User.Username = History.Username
WHERE AdoptionDate IS NOT NULL
GROUP BY City
ORDER BY Adopter_Count DESC; 

-- Donations by City
SELECT City, COUNT(*) AS Donation_Count, SUM(Amount) AS Total_Donations
FROM Donation
GROUP BY City
ORDER BY Total_Donations DESC; 


-- Are there noticeable differences in the types of animals adopted by people in different cities?
SELECT User.City, Animal.Type, COUNT(*) AS Num_Adoptions
FROM User 
JOIN History ON User.Username = History.Username
JOIN Animal ON History.Animal_ID = Animal.ID
WHERE AdoptionDate IS NOT NULL 
GROUP BY User.City, Animal.Type
ORDER BY User.City, Num_Adoptions DESC;

-- Volunteers with Specific requirements
SELECT * 
FROM Volunteer
WHERE about LIKE '%Student%';


-- Who are the vet doctors associated with your organization"
SELECT DISTINCT Vet_Name 
FROM Vet_Record 
;

-- Complete details of the volunteer
SELECT Volunteer.ID, Volunteer.Username, User.Name, Volunteer.Contact_Info, User.Email, Volunteer.About, Volunteer.Availability
FROM Volunteer
JOIN User ON Volunteer.Username = User.Username; 

-- Are there correlations between donation amounts and the adopter's city?
SELECT User.City, AVG(Donation.Amount) AS Avg_Donation, SUM(Donation.Amount) AS Total_Donation
FROM Donation
JOIN User ON Donation.Username = User.Username
GROUP BY User.City
ORDER BY Avg_Donation DESC; 

-- Are certain breeds adopted more quickly than others?
SELECT Breed, AVG(DATEDIFF(AdoptionDate, DATE(RequestDate))) AS Avg_Days_To_Adoption 
FROM Animal
JOIN History ON Animal.ID = History.Animal_ID
WHERE AdoptionDate IS NOT NULL 
GROUP BY Breed
ORDER BY Avg_Days_To_Adoption; 

