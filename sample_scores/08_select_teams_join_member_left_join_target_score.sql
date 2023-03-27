/* 期間中のチーム毎のメンバーの試合とスコア */
select
  teams.pos as team_pos,
  teams.team_name,
  members.id as member_id,
  members.member_name,
  target_score.match_id,
  target_score.score
from
  sample_scores.teams teams
  inner join sample_scores.members members on teams.id = members.team_id
  left join
    (
      select
        scores.member_id
        ,scores.match_id
        ,scores.score
      from
        sample_scores.scores scores
        inner join sample_scores.matches matches on matches.id = scores.match_id
      where matches.match_on between '2022-06-01' and '2022-06-30'
    ) target_score on target_score.member_id = members.id