--Problemset<1>, <30-NOV-2017>
--submission by<srinath.subbaraman@accenture.com>

/*List full details of all hotels.*/

 select * from hotel_table;

/*List full details of all hotels in New York*/

 select * from hotel_table where city='new york';

/*List the names and cities of all guests, ordered according to their cities*/

 select name,city from guest_table order by city;

/*List all details for non-smoking rooms in ascending order of price.*/

 select* from room_table where type='n' order by price;

/*List the number of hotels there are.*/

 select count(hotel_no) from hotel_table;

/*List the cities in which guests live. Each city should be listed only once.*/

 select distinct(city) from guest_table;

/*List the average price of a room.*/

 select avg(price) from room_table;

/*List hotel names, their room numbers, and the type of that room.*/

 select name, room_no, type from hotel_table, room_table where room_table.hotel_no=hotel_table.hotel_no;

/*List the hotel names, booking dates, and room numbers for all hotels in New York.*/

 select name, date_from, date_to, room_no from hotel_table, booking_table 
where hotel_table.hotel_no = booking_table.hotel_no and hotel_table.city='new york';

/*What is the number of bookings that started in the month of September?*/

select count(date_from) from booking_table where date_from like "%sep%";

/*List the names and cities of guests who began a stay in New York in August.*/

select name,city from ((guest_table inner join booking_table on guest_table.guest_no=booking_table.guest_no) inner join hotel_table on 
booking_table.hotel_no=hotel_table.hotel_no) where hotel_table.city="new york" and booking_Table.date_from like "%aug%"; 

/*List the hotel names and room numbers of any hotel rooms that have not been booked.*/

select room_no, name from hotel_table,room_table where room_table.room_no not in(Select room_no from booking_table) and room_table.hotel_no=hotel_table.hotel_no;

/*List the hotel name and city of the hotel with the highest priced room*/

 select name, city from hotel_table where hotel_table.hotel_no = (select hotel_no from room_table where price =(select max(price) from room_table));

/*List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.*/

 select name,city,room_no, price from room_table,hotel_table where price < (select min(price) from room_table,hotel_table where hotel_table.hotel_no=room_table.hotel_no and hotel_table.city='boston') and room_table.hotel_no=hotel_table.hotel_no;

/*List the average price of a room grouped by city*/

 select city,avg( price ) from hotel_table inner join room_table on hotel_table.hotel_no = room_table.Hotel_no group by city;