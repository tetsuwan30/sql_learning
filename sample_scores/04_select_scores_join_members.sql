/* チーム毎のメンバー一覧 */
select
  teams.pos as team_pos,
  teams.team_name,
  members.id as member_id,
  members.member_name
from
  sample_scores.teams teams
  inner join sample_scores.members members on teams.id = members.team_id