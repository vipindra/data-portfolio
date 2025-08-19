
-- Moderation & Knowledge Tagging SQL

SELECT status, COUNT(*) AS count_items
FROM moderation_queue
GROUP BY status
ORDER BY count_items DESC;

SELECT p.topic,
       AVG(s.first_response_minutes) AS avg_first_response,
       AVG(s.resolution_minutes)     AS avg_resolution
FROM posts p
JOIN sla s ON p.post_id = s.post_id
GROUP BY p.topic
ORDER BY avg_resolution ASC;

SELECT tag_primary,
       AVG(responses) AS avg_responses,
       AVG(likes)     AS avg_likes
FROM posts
GROUP BY tag_primary
ORDER BY avg_likes DESC;

SELECT assigned_to, COUNT(*) AS items_handled
FROM moderation_queue
WHERE status IN ('reviewed','actioned')
GROUP BY assigned_to
ORDER BY items_handled DESC;
