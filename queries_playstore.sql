-- Comments in SQL Start with dash-dash --
--1)  Find the entire record for the app with an ID of `1880`.
SELECT id from analytics WHERE id = 1880;
--2 Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id,app_name from analytics WHERE last_updated = '2018-08-01';
--3 Count the number of apps in each category, e.g. "Family | 1972".
SELECT DISTINCT category,COUNT(*) FROM analytics GROUP BY category;
--4 Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name,id  FROM analytics ORDER BY reviews desc;
-- SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;
--5 Find the full record of the app that has the most reviews 
--     with a rating greater than equal to 4.8.
SELECT app_name FROM analytics WHERE rating >= 4.8;
--- SELECT * FROM analytics WHERE rating >= 4.8  ORDER BY reviews DESC LIMIT 1;
--6Find the average rating for each category ordered 
--      by the highest rated to lowest rated.
SELECT DISTINCT category, AVG(rating) avg_rating FROM analytics GROUP BY category ORDER BY avg_rating;
--SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY avg DESC;
-- 7 Find the name, price, and rating of the most 
--     expensive app with a rating that's less than 3
SELECT app_name,price,rating  FROM analytics rating<3 AND price =(SELECT MAX(price) FROM analytics ) ;

---SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

--8 Find all records with a min install not exceeding 50, that have a rating. 
--      Order your results by highest rated first.
SELECT app_name,rating,min_installs FROM analytics WHERE min_installs <= 50 ORDER BY rating DESC;
--SELECT * FROM analytics 
  --WHERE min_installs <= 50 
    --AND rating IS NOT NULL 
  --ORDER BY rating DESC;\
-- 9 Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name,rating,reviews FROM analytics WHERE rating<3 AND reviews >10000;
--10 Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics WHERE price BETWEEN 0.10 AND 1 ORDER BY reviews DESC LIMIT 10; 
--11 find the most out of date app.
SELECT * FROM analytics WHERE last_updated = (SELECT min(last_updated) FROM analytics);
--12  Find the most expensive app
SELECT * FROM analytics 
  WHERE price = (SELECT MAX(price) FROM analytics);
--13 count all the reviews in the Google Play Store.
SELECT COUNT(reviews) FROM analytics;
-- SELECT SUM(reviews) AS "All the Reviews" FROM analytics;
-- 14. Find all the categories that have more than 300 apps in them.
SELECT DISTINCT category,COUNT(app_name) AS app_count FROM analytics GROUP BY category HAVING COUNT(app_name)>=300;
--SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
-- 15. Find the app that has the highest proportion of reviews to min_installs,
-- among apps that have been installed at least 100,000 times. Display the name of the app
-- along with the number of reviews, the min_installs, and the proportion.

