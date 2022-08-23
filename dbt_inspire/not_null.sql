WITH 
target_model AS(
  SELECT
    id
    ,member_name
    ,team_id
  FROM
    sample_scores.members
)
SELECT
  CASE
    WHEN 
      SUM (CASE WHEN id IS NOT null 
                THEN 0 
                ELSE 1 END
          ) = 0 
    THEN True
    ELSE False
  END AS result
FROM
  target_model
