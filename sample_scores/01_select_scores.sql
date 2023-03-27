/* メンバー毎の試合数とスコアの集計 */
select
  member_id,
  sum(score) as score_sum,
  count(match_id) as match_count,
  count(distinct match_id) as match_unique_count
from sample_scores.scores
group by member_id