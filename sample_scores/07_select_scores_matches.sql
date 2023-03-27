/* 該当の期間の試合のスコア */
select
  scores.member_id,
  scores.match_id,
  scores.score
from
  sample_scores.scores scores
  inner join sample_scores.matches matches on matches.id = scores.match_id
where matches.match_on between '2022-06-01' and '2022-06-30'