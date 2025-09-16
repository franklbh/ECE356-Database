-- Q1a: all comments for p0
SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p0'
ORDER BY username, submitted_at, code_filename, start_line;

-- Q1b: all comments for p5
SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p5'
ORDER BY username, submitted_at, code_filename, start_line;

-- Q2a: comments for p0 in f24
SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p0' AND term = 'f24'
ORDER BY username, submitted_at, code_filename, start_line;

-- Q2b: comments for p1 in w25
SELECT username, term, project, submitted_at,
       code_filename, start_line, end_line, comment_text
FROM comments
WHERE project = 'p1' AND term = 'w25'
ORDER BY username, submitted_at, code_filename, start_line;

-- Q3: avg cognitive complexity per function per project (sorted)
SELECT project, function_name, AVG(complexity) AS avg_complexity
FROM cognitive_complexity
GROUP BY project, function_name
ORDER BY project, function_name;

-- Q4: function names in p5 that are NOT in p3
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