-- Q1a: all comments for p0, 0.05

-- time: 0.05, 0.04, 0.04
-- optimized time: 0.03, 0.04, 0.03

SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p0';

-- Q1b: all comments for p5, 1.18

-- time: 1.06, 0.98, 1.02
-- optimized time: 1.02, 0.98, 0.98

SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p5';

-- Q2a: comments for p0 in f24, 0.05

-- time: 0.04, 0.04, 0.04
-- optimized time: 0.04, 0.04, 0.03

SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p0' AND term = 'f24';

-- Q2b: comments for p1 in w25

-- time: 0.34, 0.32, 0.32
-- optimized time: 0.31, 0.32, 0.32
SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p1' AND term = 'w25';

-- Q3: avg cognitive complexity per function per project (sorted), done (maybe)

-- time: 0.30, 0.29, 0.29
-- optimized time: 0.13, 0.12, 0.13

SELECT project, function_name, AVG(complexity) AS avg_complexity
FROM cognitive_complexity
GROUP BY project, function_name
ORDER BY project, function_name;

-- Q4: function names in p5 that are NOT in p3

-- time: 0.06, 0.06, 0.07
-- optimized time: 0.06, 0.06, 0.07

SELECT DISTINCT c5.function_name
FROM cognitive_complexity AS c5
WHERE c5.project = 'p5'
  AND NOT EXISTS (
    SELECT 1
    FROM cognitive_complexity AS c3
    WHERE c3.project = 'p3'
      AND c3.function_name = c5.function_name
  )
ORDER BY c5.function_name;
