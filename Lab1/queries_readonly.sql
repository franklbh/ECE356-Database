-- Q5: submissions that have comments but NO test scores
SELECT DISTINCT
  c.username, c.term, c.project, c.submitted_at
FROM comments AS c
WHERE NOT EXISTS (
  SELECT 1
  FROM test_scores AS t
  WHERE t.username     = c.username
    AND t.term         = c.term
    AND t.project      = c.project
    AND t.submitted_at = c.submitted_at
)
ORDER BY c.username, c.term, c.project, c.submitted_at;