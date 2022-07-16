/* メンバー毎の試合数とスコアの集計 */
SELECT
  member_id
  ,count(match_id) as match_count
  ,sum(score) as score_sum
FROM
  sample_scores.scores
GROUP BY
  member_id
;
