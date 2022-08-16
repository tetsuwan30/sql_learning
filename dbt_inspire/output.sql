WITH target_model AS(
  
/* メンバーの一覧 */ SELECT   id   ,member_name   ,team_id FROM   sample_scores.members

)
SELECT
  CASE WHEN COUNT(id) = COUNT(DISTINCT id) THEN true
       ELSE false
  END AS result
FROM
  target_model
