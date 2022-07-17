/* 期間中のチーム毎のメンバーの試合とスコア */
SELECT
  teams.pos as team_pos
  ,teams.team_name
  ,members.id as member_id
  ,members.member_name
  ,target_score.match_id
  ,target_score.score
FROM
  sample_scores.teams teams
  inner join sample_scores.members members
     on teams.id = members.team_id
  left join
    (
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
    ) target_score
     on target_score.member_id = members.id
;
