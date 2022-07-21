/* 該当の期間の試合 */
SELECT
  id
FROM
  sample_scores.matches matches
WHERE
  match_on BETWEEN '2022-06-01' and '2022-06-30'
;
