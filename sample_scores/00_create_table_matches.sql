create table sample_scores.matches (
  id int not null,
  match_on date not null,
  primary key (id)
);

insert into sample_scores.matches (id, match_on) values
  (1001, '2022-06-01'),
  (1002, '2022-06-02'),
  (1003, '2022-06-03'),
  (1004, '2022-06-04'),
  (1005, '2022-06-05'),
  (1006, '2022-06-06'),
  (1007, '2022-06-07'),
  (1008, '2022-06-08'),
  (1009, '2022-06-09'),
  (1010, '2022-06-10');