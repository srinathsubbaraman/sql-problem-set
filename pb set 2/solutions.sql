--Problemset<problemset 2>, <30-NOV-2017>
--submission by<srinath.subbaraman@accenture.com>


/*Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden:*/

select total(weight) from picked where plantfk = (select plantid from plant where name='Corn');

/*For some reason Erin has change his location for picking the tomato to North. Write the corresponding query.*/



/*Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores Experience of the of person. How will you modify this to varchar2(30).*/

alter table gardener add column exper number(30);
/*alter table gardener modify exper varchar2(30);*/

/*Write a query to find the plant name which required seeds less than 20 which plant on 14-APR*/

select name from plant where plantid = (select plantfk from planted where seeds<20 and date1 = '14-APR-2012')

/*List the amount of sunlight and water to all plants with names that start with letter 'c' or letter 'r'.*/

select name,sunlight, water from plant where name like 'C%' or name like 'R%'

/*Write a valid SQL statement that displays the plant name and the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.*/

select plant.name, sum(seeds) from plant inner join planted on plant.plantid=planted.plantfk group by name order by name desc

/*Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average Number of Items = Total Amount Picked / Total Seeds Planted.)*/



/*Write a valid SQL statement that would produce a result set like the following:

 name |  name  |    date    | amount 
------|--------|------------|-------- 
 Tim  | Radish | 2012-07-16 |     23 
 Tim  | Carrot | 2012-08-18 |     28 */

select gardener.name, plant.name, picked.date1, picked.amount from plant,gardener, picked where gardener.gardenerid=picked.gardenerfk and plant.plantid=picked.plantfk and amount between 20 and 30 order by plant.name desc;

/*Find out persons who picked from the same location as he/she planted.*/

select distinct(name) from gardener where gardenerid in (select picked.gardenerFK from picked,planted where planted.gardenerfk=picked.gardenerfk and planted.locationfk=picked.locationfk);

/*Create a view that lists all the plant names picked from all locations except ’West’ in the month of August.*/

create view palntview as select * from plant where plantid not in(select distinct(plantfk) from picked where locationfk in(select locationid from location where name="West") and date1 like "%AUG%");