
-- Events & Program Ops SQL

SELECT type,
       AVG(attendance_rate) AS avg_attendance_rate
FROM events
GROUP BY type
ORDER BY avg_attendance_rate DESC;

SELECT campaign, AVG(nps) AS avg_nps
FROM events
GROUP BY campaign
ORDER BY avg_nps DESC;

SELECT strftime('%Y-%m', month) AS ym,
       AVG(conversion) AS avg_conversion
FROM challenges
GROUP BY ym
ORDER BY ym;

SELECT title, completion_rate, enrolled
FROM academy_courses
ORDER BY completion_rate DESC
LIMIT 5;

SELECT user_id, posts, likes, helpful_flags
FROM contributors
ORDER BY helpful_flags DESC, likes DESC
LIMIT 20;
