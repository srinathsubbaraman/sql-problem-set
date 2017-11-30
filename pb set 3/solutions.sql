--Problemset<problemset 3>, <30-NOV-2017>
--submission by<srinath.subbaraman@accenture.com>

/*Find the titles of all movies directed by Steven Spielberg. */

select title from movie where director='steven spielberg';

/*Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. (1 point possible)*/

select title, year from movie where mid in (select mid from rating where stars in (4,5) order by stars);

/*Find the titles of all movies that have no ratings.*/

select title from movie where mid not in(select distinct(mid) from rating);

/*Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. (1 point possible)*/

select name from reviewer where rid in(select rid from rating where ratingdate is NULL);

/*Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. (1 point possible)*/

select name, title ,stars, ratingdate from movie, reviewer, rating where movie.mid = rating.mid and reviewer.rid = rating.rid order by name, title, stars;

/*Find the names of all reviewers who rated Gone with the Wind. (1 point possible)*/

select name from reviewer where rid in (select rid from rating where mid in (select mid from movie where title ='gone with the wind'));

/*Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) (1 point possible)*/

select movie.title, reviewer.name from ((movie inner join rating on movie.mid=rating.mid) inner join reviewer on reviewer.rid= rating.rid) order by reviewer.name,movie.title;

/*Find the titles of all movies not reviewed by Chris Jackson. (1 point possible)*/

select title from movie where mid not in (select mid from rating where rid = (select rid from reviewer where name= "chris jackson"));

/*For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars. (1 point possible)*/

select movie.title, reviewer.name, rating.stars from ((movie inner join rating on movie.mid=rating.mid) inner join reviewer on reviewer.rid=rating.rid) where rating.stars in(select min(stars) from rating);

/*List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. (1 point possible)*/

select movie.title,avg(stars)  from movie inner join rating on movie.mid=rating.mid group by title order by stars desc,title;

/*Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.) (1 point possible)*/

select title, director from movie where director in (select director from (select director, count(title) as no from movie group by director) as t where t.no>1)order by director,title;

/*Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.) (1 point possible)*/

select title, max(t) from (select mid,avg(stars) as t from rating group by mid) as w, movie where w.mid=movie.mid;

/*Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.) (1 point possible)*/

select title, min(t) from (select mid,avg(stars) as t from rating group by mid) as w, movie where w.mid=movie.mid;
 
/*For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. (1 point possible)*/

select title, director, rate from (select max(stars) as rate, mid from rating group by mid)as x,movie where x.mid=movie.mid and director is not NULL;
