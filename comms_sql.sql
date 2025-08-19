
-- Community Comms Performance SQL

SELECT channel,
       AVG(open_rate)   AS avg_open_rate,
       AVG(ctr)         AS avg_ctr,
       AVG(reply_rate)  AS avg_reply_rate
FROM comms_data
GROUP BY channel
ORDER BY avg_open_rate DESC;

SELECT segment,
       AVG(open_rate) AS avg_open_rate,
       AVG(ctr)       AS avg_ctr
FROM comms_data
GROUP BY segment
ORDER BY avg_open_rate DESC;

SELECT program, channel,
       AVG(open_rate) AS avg_open_rate,
       AVG(ctr)       AS avg_ctr,
       AVG(reply_rate) AS avg_reply_rate
FROM comms_data
GROUP BY program, channel
ORDER BY avg_ctr DESC;

SELECT strftime('%w', send_time) AS dow,
       AVG(open_rate) AS avg_open_rate,
       AVG(ctr)       AS avg_ctr
FROM comms_data
GROUP BY dow
ORDER BY avg_open_rate DESC;

SELECT subject,
       AVG(open_rate + ctr) AS engagement_score,
       COUNT(*) AS sends
FROM comms_data
GROUP BY subject
HAVING COUNT(*) >= 5
ORDER BY engagement_score DESC
LIMIT 10;
