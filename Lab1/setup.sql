-- Q1 and Q2, comments queries
CREATE INDEX idx_comments_project_term 
  ON comments (project, term);

-- Q3, cognitive complexity avg per function per project
CREATE INDEX idx_cog_project_func
  ON cognitive_complexity(project, function_name, complexity);

-- update: this is not necessary
-- -- Q4, cognitive complexity function names in one project but not another
CREATE INDEX idx_cog_proj_function
  ON cognitive_complexity (project, function_name);
