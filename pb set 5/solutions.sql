--Problemset<problemset 5>, <30-NOV-2017>
--submission by<srinath.subbaraman@accenture.com>

/*Find all the performers who played guitar or violin and were born in England. (1 point possible)*/

select m_name from musician where m_no in(select m_no from musician,performer where born_in in (select place_no from place where place_country='england') and performer.instrument in('violin','guitar') and m_no=perf_is);

/*Find all the performers who played guitar or violin and were born in England. (1 point possible)*/

select concert.con_date, place.place_town, place.place_country, musician.m_name from ((musician inner join concert on musician.m_no=concert.concert_organiser) inner join place on place.place_no = concert.concert_in) where place.place_country = "usa";

/*List the different instruments played by the musicians and avg number of musicians who play the instrument. (1 point possible)*/

select instrument,avg((select count(*) from performer group by instrument)) from performer group by instrument;

/*List the names, dates of birth and the instrument played of living musicians who play a instrument which Theo also plays. (1 point possible)*/

 select m_name, born, instrument from musician inner join performer on musician.m_no=performer.perf_is where perf_is in(select distinct(perf_is) from performer where instrument in(select instrument from performer where perf_is in (select m_no from musician where m_name like "theo%")))and died is NULL and instrument in (select instrument from performer where perf_is in (select m_no from musician where m_name like "theo%")) and m_name not like "theo%";

/*Show the least commonly played instrument and the number of musicians who play it. (1 point possible)*/

(select instrument, count(*) as no_of_players from performer group by instrument having count(*)=1);

/*List the name and town of birth of any performer born in the same city as James First.(1 point possible)*/

select m_name, place_town from musician,place where born_in =(select born_in from musician where m_name ="james first") and musician.born_in = place.place_no;



