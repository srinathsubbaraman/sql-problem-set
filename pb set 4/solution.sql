--Problemset<problemset 4>, <30-NOV-2017>
--submission by<srinath.subbaraman@accenture.com>

/*Find the names of all students who are friends with someone named Gabriel. (1 point possible)*/

select name from highschooler where id in (select id2 from friend where id1 in (select id from highschooler where name="gabriel"));

/*For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order. (1 point possible)*/

select name, grade from highschooler where id in (select a.id1 from likes a,likes b where a.id1=b.id2 and a.id2=b.id1);

/*Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. (1 point possible)*/

select name,grade from highschooler where id not in(select id1 from likes) and id not in (select id2 from likes)order by grade,name;

/*For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. (1 point possible)*/

select name, grade from highschooler where id in(select id1 from likes where id2 in(select distinct(id2) from likes where id2 not in (select id1 from likes))
union
select id2 from likes where id2 in(select distinct(id2) from likes where id2 not in (select id1 from likes)));

/*Find the difference between the number of students in the school and the number of different first names. (1 point possible)*/

select  count(*) - count(distinct(name) from highschooler;

/*Find the name and grade of all students who are liked by more than one other student. (1 point possible)*/

select name, grade from highschooler inner join likes on highschooler.id = likes.id2 group by id2 having count(*)>=2;
