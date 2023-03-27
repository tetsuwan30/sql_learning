/* 期間中のチーム毎のメンバーの試合とスコアを集計 */
select
  teams.pos as team_pos,
  teams.team_name,
  count(target_score.match_id) as match_count,
  sum(target_score.score) as score_sum
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
    ) target_score
     on target_score.member_id = members.id
group by
  teams.pos
  ,teams.team_name
order by
  teams.pos
;
