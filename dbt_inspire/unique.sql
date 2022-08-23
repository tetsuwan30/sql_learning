WITH target_model AS(
  
%%target_model%%

)
SELECT
  CASE
    WHEN COUNT(%%target_column%%) = COUNT(DISTINCT %%target_column%%) 
    THEN True
    ELSE False
  END AS result
FROM
  target_model
