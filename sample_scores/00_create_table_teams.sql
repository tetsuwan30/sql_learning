create table sample_scores.teams (
  pos int not null,
  id int not null,
  team_name varchar(255) not null,
  primary key (id)
);

insert into sample_scores.teams (pos, id, team_name) values
  (1, 1001, 'Team A'),
  (2, 1002, 'Team B'),
  (3, 1003, 'Team C'),
  (4, 1004, 'Team D'),
  (5, 1005, 'Team E');
