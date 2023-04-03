create table sample_scores.scores (
  member_id int not null,
  match_id int not null,
  score int,
  primary key (member_id, match_id)
);

/*
以下は、チームAからチームEまでの各チームの5人全員が1試合ずつプレイした場合の30レコード分の例です。
それぞれの試合で1チームが0点から5点のランダムな得点を獲得し、
もう1チームが逆転することもあるという想定で記述しています。
*/

insert into sample_scores.scores (member_id, match_id, score) values
-- Match 1
(2001, 1001, 3), (2002, 1001, 5), (2003, 1001, 0), (2004, 1001, 4), (2005, 1001, 2),
(2006, 1001, 1), (2007, 1001, 2), (2008, 1001, 4), (2009, 1001, 5), (2010, 1001, 1),
-- Match 2
(2001, 1002, 2), (2002, 1002, 0), (2003, 1002, 1), (2004, 1002, 5), (2005, 1002, 4),
(2006, 1002, 3), (2007, 1002, 1), (2008, 1002, 2), (2009, 1002, 4), (2010, 1002, 0),
-- Match 3
(2011, 1003, 0), (2012, 1003, 3), (2013, 1003, 4), (2014, 1003, 2), (2015, 1003, 1),
(2016, 1003, 4), (2017, 1003, 5), (2018, 1003, 2), (2019, 1003, 1), (2020, 1003, 3),
-- Match 4
(2011, 1004, 1), (2012, 1004, 3), (2013, 1004, 5), (2014, 1004, 0), (2015, 1004, 4),
(2021, 1004, 5), (2022, 1004, 1), (2023, 1004, 2), (2024, 1004, 0), (2025, 1004, 3),
-- Match 5
(2011, 1005, 3), (2012, 1005, 4), (2013, 1005, 2), (2014, 1005, 1), (2015, 1005, 5),
(2021, 1005, 4), (2022, 1005, 2), (2023, 1005, 3), (2024, 1005, 1), (2025, 1005, 0),
-- Match 6
(2001, 1006, 3), (2002, 1006, 2), (2003, 1006, 5), (2004, 1006, 0), (2005, 1006, 1),
(2006, 1006, 4), (2007, 1006, 2), (2008, 1006, 1), (2009, 1006, 3), (2010, 1006, 5),
-- Match 7
(2011, 1007, 5), (2012, 1007, 4), (2013, 1007, 3), (2014, 1007, 1), (2015, 1007, 2),
(2016, 1007, 0), (2017, 1007, 2), (2018, 1007, 1), (2019, 1007, 5), (2020, 1007, 4),
-- Match 8
(2011, 1008, 2), (2012, 1008, 5), (2013, 1008, 4), (2014, 1008, 1), (2015, 1008, 3),
(2021, 1008, 3), (2022, 1008, 0), (2023, 1008, 2), (2024, 1008, 4), (2025, 1008, 5),
-- Match 9
(2011, 1009, 1), (2012, 1009, 2), (2013, 1009, 0), (2014, 1009, 5), (2015, 1009, 3),
(2021, 1009, 5), (2022, 1009, 2), (2023, 1009, 3), (2024, 1009, 4), (2025, 1009, 1),
-- Match 10
(2001, 1010, 4), (2002, 1010, 2), (2003, 1010, 5), (2004, 1010, 1), (2005, 1010, 0),
(2006, 1010, 3), (2007, 1010, 1), (2008, 1010, 2), (2009, 1010, 4), (2010, 1010, 5);
