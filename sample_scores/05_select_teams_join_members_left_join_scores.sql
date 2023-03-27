/* チーム毎のメンバーの試合とスコア*/
select
  teams.pos as team_pos,
  teams.team_name,
  members.id as member_id,
  members.member_name,
  scores.match_id,
  scores.score
from
  sample_scores.teams teams
  inner join sample_scores.members members on teams.id = members.team_id
  left join sample_scores.scores scores on scores.member_id = members.id