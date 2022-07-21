/* チーム毎のメンバー一覧 */
SELECT
  teams.pos AS team_pos
  ,teams.team_name
  , members.id AS member_id
  , members.member_name
FROM
  sample_scores.teams teams
  INNER JOIN sample_scores.members members
     ON teams.id = members.team_id
;
