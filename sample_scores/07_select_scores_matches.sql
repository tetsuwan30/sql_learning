/* 該当の期間の試合のスコア */
SELECT
  scores.member_id
  ,scores.match_id
  ,scores.score
FROM
  sample_scores.scores scores
  inner join sample_scores.matches matches
    on matches.id = scores.match_id
WHERE
  matches.match_on between '2022-06-01' and '2022-06-30'
;
