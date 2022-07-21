/* メンバー毎の試合数とスコアの集計 */
SELECT
  member_id
  ,SUM(score) AS score_sum
  ,COUNT(match_id) AS match_count
  ,COUNT(DISTINCT match_id) AS match_unique_count
FROM
  sample_scores.scores
GROUP BY
  member_id
;
