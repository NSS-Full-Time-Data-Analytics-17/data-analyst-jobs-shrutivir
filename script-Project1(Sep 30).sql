-- Q1,Number of rows in table?---
Select COUNT(*) AS number_rows
FROM data_analyst_jobs;
--ANSWER- 1793--

--Q2,Company associated with 10 row is 'Exxon Mobil'---
SELECT company 
FROM data_analyst_jobs
LIMIT 10;

--Q3,Number of posting in tennesse'21' AND kY '6' TOTAL '27'------
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'KY' OR location = 'TN';

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location IN ('TN','KY');

---Q4,Number of posting above start rating 4**ANSWER'3'---
SELECT COUNT(*) AS posting_starrating_above4
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

---Q5,Number of posting whose review count between 500 and 1000 ANSWER '151'---

SELECT COUNT(*) AS Total_higher_reviews
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

---Q6,Average star ration for each states and highest rating(4.20 FOR NE)---

SELECT ROUND(AVG(star_rating), 2) AS avg_rating,location AS state
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;


---Q7,Number of Unique job titles--ANSWER-881----
SELECT COUNT(DISTINCT title) AS Unique_job_titles
FROM data_analyst_jobs;

----Q8, Number of Unique job titles in California--ANSWER-230----
SELECT COUNT(DISTINCT title) as Unique_title_CA
FROM data_analyst_jobs
WHERE location = 'CA';

----Q9,Total no. of companies with more that 5000 reviews ANSWER (40)------

SELECT COUNT(DISTINCT company), ROUND(AVG(star_rating), 2) AS avg_star_rating 
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

SELECT COUNT(DISTINCT company) AS Companies_over5000_reviews
FROM data_analyst_jobs
WHERE review_count > 5000;

---Q.10,AVG star rating from highest to lowest---ANSWER-General Motors-'4.20'rating--


SELECT company, ROUND(AVG(star_rating), 2) AS avg_star_rating 
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;

---Q.11,Number of Job based on 'Analyst'--Answer 774--
SELECT DISTINCT(title) AS distinct_job_titles
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

SELECT COUNT(DISTINCT title) AS distinct_job_titles
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

---Q.12,Number of Job titles not contain word 'Analyst' and 'Analytics' ANSWER 4---

SELECT DISTINCT(title) AS diff_job_titles
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

SELECT COUNT(DISTINCT title) AS diff_job_titles
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

---BONUS-Number of jobs by industry ----


SELECT COUNT(title),domain AS jobs_skills_SQL
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;








