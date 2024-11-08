
create database moviemetrics 
use moviemetrics

create table movies(
movie_id int primary key auto_increment ,
movie_name varchar(255) not null ,
genre varchar(100) default 'Unknown',
director varchar(255),
language varchar(50),
type varchar(20))


create table theatre(
theatre_id int primary key auto_increment ,
theatre_name varchar(255) not null,
city varchar(255) not null
)

create table shows(
show_id int primary key auto_increment,
theatre_id int,
movie_id int,
show_date date not null,
start_time time,
duration int,
Foreign key (theatre_id) references theatre(theatre_id),
Foreign key (movie_id) references movies(movie_id)
)

create table user(
user_id int primary key auto_increment ,
user_name varchar(255) not null,
phone_no varchar(15) unique not null,
email varchar(255) unique not null
)

create table bookings(
booking_id int primary key auto_increment ,
user_id int,
movie_id int,
show_id int,
booking_date date not null,
ticket_count int not null,
Foreign key (user_id) references user(user_id),
Foreign key (movie_id) references movies(movie_id),
Foreign key (show_id) references shows(show_id)
)

show tables
describe movies;


-- 20 movies
insert into movies(movie_id, movie_name, genre,director, language, type)
values
(1001,'Inception','Sci-Fi','Christopher Nolan','English','IMAX'),
(1002, 'Dil Chahta Hai', 'Drama', 'Farhan Akhtar', 'Hindi', '2D'),
(1003, 'Baahubali: The Beginning', 'Action', 'S. S. Rajamouli', 'Telugu', 'IMAX'),
(1004, 'Spirited Away', 'Animation', 'Hayao Miyazaki', 'Japanese', '2D'),
(1005, 'Zindagi Na Milegi Dobara', 'Comedy', 'Zoya Akhtar', 'Hindi', '2D'),
(1006, 'The Shawshank Redemption', 'Drama', 'Frank Darabont', 'English', '2D'),
(1007, 'Lagaan', 'Historical', 'Ashutosh Gowariker', 'Hindi', '2D'),
(1008, 'Dangal', 'Sports', 'Nitesh Tiwari', 'Hindi', '2D'),
(1009, 'The Dark Knight', 'Action', 'Christopher Nolan', 'English', 'IMAX'),
(1010, 'Drishyam', 'Thriller', 'Jeethu Joseph', 'Malayalam', '2D'),
(1011, 'Kantara', 'Action', 'Rishab Shetty', 'Kannada', 'IMAX'),
(1012, 'The Handmaiden', 'Thriller', 'Park Chan-wook', 'Korean', '2D'),
(1013, 'Your Name', 'Animation', 'Makoto Shinkai', 'Japanese', '2D'),
(1014, 'Swaas', 'Drama', 'Madhur Bhandarkar', 'Marathi', '2D'),
(1015, 'Mangal Pandey: The Rising', 'Historical', 'Ketan Mehta', 'Hindi', 'IMAX'),
(1016, 'Kahaani', 'Thriller', 'Sujoy Ghosh', 'Hindi', '2D'),
(1017, 'Avatar', 'Sci-Fi', 'James Cameron', 'English', '3D'),
(1018, 'PK', 'Comedy', 'Rajkumar Hirani', 'Hindi', 'IMAX'),
(1019, 'The Lion King', 'Animation', 'Jon Favreau', 'English', 'IMAX'),
(1020, 'Gully Boy', 'Drama', 'Zoya Akhtar', 'Hindi', 'IMAX')
select * from movies

-- 10 theatres
insert into theatre (theatre_id, theatre_name, city)
values
(2001,'IMAX Cinemas', 'Mumbai'),
(2002,'PVR Cinemas', 'Delhi'),
(2003,'Cinepolis', 'Bangalore'),
(2004,'Inox', 'Hyderabad'),
(2005,'Fun Cinemas', 'Chennai'),
(2006,'Carnival Cinemas', 'Kolkata'),
(2007,'Satyam Cineplexes', 'Jaipur'),
(2008,'Silver Screens', 'Pune'),
(2009,'Big Cinemas', 'Ahmedabad'),
(2010,'Cineworld', 'Mumbai')
select * from theatre

#SET SQL_SAFE_UPDATES = 0;


-- 10 users
insert into user(user_id,user_name, phone_no, email)
values
(3001,'Aditi Shetti', '9876543210', 'aditi.shetti@example.com'),
(3002,'Priya Patel', '9123456789', 'priya.patel@example.com'),
(3003,'Ravi Kumar', '9988776655', 'ravi.kumar@example.com'),
(3004,'Sneha Gupta', '9898989898', 'sneha.gupta@example.com'),
(3005,'Rahul Mehta', '9765432109', 'rahul.mehta@example.com'),
(3006,'Aarti Shetti', '9654321098', 'aarti.shetti@example.com'),
(3007,'Vikram Singh', '9556677889', 'vikram.singh@example.com'),
(3008,'Neha Reddy', '9445566778', 'neha.reddy@example.com'),
(3009,'Diya Kasbekar', '9222333444', 'diya.kasbekar@example.com'),
(3010,'Rohan Joshi', '9333221111', 'rohan.joshi@example.com')
select * from user


-- jan to june 2024 shows  # 10 + 3 shows
describe shows
insert into shows(show_id, theatre_id , movie_id, show_date,start_time,duration)
values
(4001, 2001, 1005, '2024-01-19', '18:30:00', 155), -- Zindagi Na Milegi Dobara @ IMAX Cinemas
(4002, 2002, 1003, '2024-02-21', '20:00:00', 180), -- Baahubali: The Beginning @ PVR Cinemas
(4003, 2003, 1007, '2024-03-07', '14:00:00', 210), -- Lagaan @ Cinepolis
(4004, 2004, 1010, '2024-03-29', '16:00:00', 160), -- Drishyam @ Inox
(4005, 2005, 1017, '2024-04-15', '19:30:00', 162), -- Avatar @ Fun Cinemas
(4006, 2006, 1002, '2024-05-27', '21:00:00', 180), -- Dil Chahta Hai @ Carnival Cinemas
(4007, 2007, 1015, '2024-05-10', '12:00:00', 180), -- Mangal Pandey: The Rising @ Satyam Cineplexes
(4008, 2008, 1009, '2024-05-19', '11:00:00', 152), -- The Dark Knight @ Silver Screens
(4009, 2009, 1012, '2024-06-07', '22:00:00', 145), -- The Handmaiden @ Big Cinemas
(4010, 2010, 1018, '2024-06-16', '15:30:00', 155) -- PK @ Cineworld

INSERT INTO shows (show_id, theatre_id, movie_id, show_date, start_time, duration)
VALUES
(4011, 2001, 1019, '2024-07-01', '17:00:00', 120), -- The Lion King @ IMAX Cinemas
(4012, 2003, 1008, '2024-07-10', '19:30:00', 140), -- Dangal @ Cinepolis
(4013, 2004, 1011, '2024-07-15', '15:00:00', 150); -- Kantara @ Inox
select * from shows


-- jan to june 2024 bookings # 10 + 2 bookings
describe bookings
insert into bookings(booking_id, user_id, movie_id, show_id, booking_date, ticket_count)
values
(5001, 3001, 1005, 4001, '2024-01-15', 2), -- Aditi Shetti booked 2 tickets for Zindagi Na Milegi Dobara
(5002, 3002, 1003, 4002, '2024-02-20', 3), -- Priya Patel booked 3 tickets for Baahubali: The Beginning
(5003, 3003, 1007, 4003, '2024-03-05', 4), -- Ravi Kumar booked 4 tickets for Lagaan
(5004, 3004, 1010, 4004, '2024-03-25', 1), -- Sneha Gupta booked 1 ticket for Drishyam
(5005, 3005, 1017, 4005, '2024-04-10', 5), -- Rahul Mehta booked 5 tickets for Avatar
(5006, 3006, 1002, 4006, '2024-04-20', 2), -- Aarti Shetti booked 2 tickets for Dil Chahta Hai
(5007, 3007, 1015, 4007, '2024-05-05', 3), -- Vikram Singh booked 3 tickets for Mangal Pandey: The Rising
(5008, 3008, 1009, 4008, '2024-05-15', 2), -- Neha Reddy booked 2 tickets for The Dark Knight
(5009, 3009, 1012, 4009, '2024-06-01', 1), -- Diya Kasbekar booked 1 ticket for The Handmaiden
(5010, 3010, 1018, 4010, '2024-06-15', 4) -- Rohan Joshi booked 4 tickets for PK

INSERT INTO bookings (booking_id, user_id, movie_id, show_id, booking_date, ticket_count)
VALUES
(5011, 3001, 1019, 4011, '2024-06-28', 3), -- Aditi Shetti booked 3 tickets for The Lion King
(5012, 3005, 1008, 4012, '2024-07-05', 4); -- Rahul Mehta booked 4 tickets for Dangal
select * from bookings



SHOW VARIABLES LIKE 'port';
SHOW VARIABLES LIKE 'hostname';



select * from user

alter table user add gender varchar(10)
update user set gender= 'Female'
 where user_id in (3001,3002,3004,3006,3008,3009)
 
update user set gender= 'Male'
 where user_id in (3003,3005,3007,3008,3010) 
 
 
 
 
 
select * from movies
select * from theatre
select * from user
select * from shows
select * from bookings
 

 
 -- 1. List all movies with their genres and directors.
select genre,director from movies


-- 2. List all directors according to their movies genres  .
select genre, group_concat(distinct director order by director)as directors_genre
from movies group by genre


-- 3. What are the total number of languages available and what all are they
select count(distinct language)as count_lang from movies 
select distinct language as distinct_lang from movies 


-- 4. Show movies according to different format types
select type,
group_concat(distinct movie_name order by movie_name)as movie_type
from movies group by type


-- 5. Display movies according to languages
select movie_id,movie_name,language 
from movies order by language


-- 6. Find all theatres located in Mumbai.
select * from theatre where city = 'Mumbai';


-- 7. Retrieve the names and email addresses of all female users.
select user_name , email from user where gender = 'Female'


-- 8. List the names and durations of movies longer than 120 minutes.
select m.movie_name , s.duration
from movies as m
join shows as s
on m.movie_id = s.movie_id
where s.duration > 120
 
 
 -- 9. Get movie names that are in the 'Drama', 'Comedy', or 'Thriller' genre.
select movie_id, movie_name
from movies where genre in ('Drama', 'Comedy','Thriller')


-- 10.total tickets sold
select sum(ticket_count) from bookings
 
 
 -- 11. Find the average duration of movies in the dataset.
select round(avg(duration),2)as avg_movie_duration
from shows


-- 12. Find the movie with longest runtime
select m.movie_name , s.duration
from shows as s
join movies as m 
on m.movie_id = s.movie_id
order by duration desc limit 1 


-- 13. All Shows in the month of March to May
select * from shows 
where show_date between '2024-03-01' and '2024-05-31'


-- 14. Names of all movies which users have booked
select m.movie_name,
       m.movie_name, 
       b.booking_id, 
       b.booking_date, 
       b.ticket_count
from movies as m
join bookings as b
on m.movie_id = b.movie_id 


-- 15. Find all users who have booked tickets for the movie "Avatar".
select u.user_name, b.booking_id,b.user_id, b.ticket_count ,m.movie_name
from bookings as b
join movies as m on m.movie_id = b.movie_id
join user as u  on u.user_id = b.user_id
where m.movie_name = 'Avatar'


-- 16. Retrieve theatre names where the theatre name do not contain 'Cinemas'
select theatre_name, city 
from theatre 
where theatre_name not like '%Cinemas%'


-- 17. Get the names of all movies playing in Mumbai or Pune or Hyderabad.
select s.show_date, m.movie_name , t.theatre_name,t.city
from theatre t 
join shows s on  s.theatre_id= t.theatre_id
join movies m on m.movie_id = s.movie_id 
where t.city in ('Mumbai','Pune','Hyderabad')


-- 18. Find movie names and theatre details where the theatre ='PVR Cinemas'and the city ='Delhi'"
select m.movie_name , t.theatre_name,t.city
from theatre t 
join shows s on s.theatre_id= t.theatre_id
join movies m on m.movie_id = s.movie_id 
where t.city = 'Delhi' and t.theatre_name= 'PVR Cinemas'


-- 19. Movies playing in theatres except Cinepolis
select m.movie_name , t.theatre_name,t.city
from theatre t 
join shows s on  s.theatre_id= t.theatre_id
join movies m  on m.movie_id = s.movie_id 
where t.theatre_name not like  'Cinepolis'


-- 20. Find the total number of tickets booked for each movie.
select m.movie_id,m.movie_name, sum(b.ticket_count)as total_tickets
from bookings b 
join movies m on m.movie_id = b.movie_id
group by m.movie_name 


-- 21. b Retrieve the details of the most popular movie (the movie with the highest number of tickets sold).
select m.movie_id,m.movie_name, sum(b.ticket_count) as total_tickets
from bookings b 
join movies m on m.movie_id = b.movie_id
group by m.movie_name
order by b.ticket_count desc limit 1  


-- 22. Get the total number of bookings made by each user.     
select u.user_name, count(booking_id) as total_bookings
from bookings b 
join user u on u.user_id = b.user_id
group by u.user_name order by total_bookings desc        # Aditi and rahul have 2 bookings


-- 23. Find users who have booked more than 2 tickets for any show.
select u.user_id , u.user_name from bookings b
join user u on u.user_id = b.user_id
 where ticket_count>2
 
 
 -- 24. List all movies that have not been booked by any user.
# LEFT JOIN
select *
from movies m  
left join bookings b on m.movie_id= b.movie_id
where b.movie_id is null


-- 25. Retrieve name of the month from the dates.
select distinct monthname(booking_date)
from bookings


-- 26. Find all the bookings made in the month of May and June.
select user_id , booking_date ,ticket_count
from bookings where monthname(booking_date) in ('May','June')


-- 27. Change format of the booking date
select booking_id, date_format(booking_date,'%d-%m-%Y')as booking_date_dmy
from bookings 


-- 28. Find the difference between the booking date and actual show date
select m.movie_name,datediff(s.show_date,b.booking_date) as days_for_show
from bookings b 
join shows s on  b.show_id= s.show_id
join movies m on m.movie_id = b.movie_id


-- 29. Change values of show_date to a month later
select show_date, 
       date_add( show_date, interval 1 month)as show_date_add_1m
from shows 


-- 30. Change values of booking_date to 5 days earlier
select booking_date,date_sub(booking_date, interval 5 day)as booking_date_sub_5d
from bookings 


-- 31. What is the most frequent day of the week for movie shows?
select show_date,dayname(show_date)as show_date_dayname, count(*) as show_count
from shows group by show_date_dayname order by show_count desc


-- 32. What day of the week corresponds to each booking date in the dataset?
select booking_date,dayofweek(booking_date)as booking_date_dayofweek 
from bookings 


-- 33. What is the day of the year for each booking date in the dataset?
select booking_date, dayofyear(booking_date) as booking_date_dayofyear
from bookings 


-- 34. What is the distribution of movie showtimes throughout the day?
select start_time, extract(hour from start_time) as start_time_hour
from shows 


-- 35. Get a list of the top 3 movies with the most tickets booked, but skip the most booked movie.
select u.user_id , u.user_name , m.movie_name ,b.ticket_count
from bookings b
join user u on u.user_id = b.user_id
join movies m on b.movie_id = m.movie_id
order by b.ticket_count desc
limit 3 offset 1


-- 36. Find the average ticket count per booking for each user.
select u.user_id , u.user_name, round(avg(b.ticket_count)) as avg_ticket_count
from user u
join bookings b 
on b.user_id= u.user_id
group by u.user_id, u.user_name
order by avg_ticket_count desc


 -- 37. Which booking had the highest number of tickets sold?
select t.theatre_name, s.start_time, s.show_date, b.ticket_count
from bookings b
join shows s on b.show_id = s.show_id
join theatre t on s.theatre_id = t.theatre_id
where b.ticket_count = (
    select MAX(b2.ticket_count)
    from bookings b2 )
limit 1;



 -- 38. List all users who have booked tickets for shows scheduled after '2024-04-01' but for less than 5 tickets.
select u.user_id, u.user_name , u.email , s.show_date , b.ticket_count
from bookings b 
join user u on b.user_id = u.user_id
join shows s on b.show_id = s.show_id
where s.show_date > '2024-04-01' and b.ticket_count < 5


-- 39. Retrieve the users who have never booked any tickets for movies in the 'Comedy' genre.
select u.user_id, u.user_name
from user u 
where not exists (
  select 1
  from bookings b
  join movies m on b.movie_id = m.movie_id
  where  b.user_id = u.user_id and m.genre = 'Comedy')
  
  
  -- 40. Find the average duration of shows for each theatre.
select t.theatre_id,t.theatre_name, 
       round(avg(s.duration),0) as avg_duration 
from shows s
join theatre t 
on t.theatre_id= s.theatre_id
group by t.theatre_id
order by avg_duration desc


-- 41. Rank Users by Ticket Count in all cities  
Select t.city ,u.user_name, b.ticket_count,
   rank() over (partition by t.city order by b.ticket_count desc)as rank_of_ticket_in_cities
from bookings b 
join user u on b.user_id = u.user_id
join shows s on s.show_id = b.show_id
join theatre t on s.theatre_id = t.theatre_id


-- 42. Rank Users by Ticket Count Across All Theatres
Select t.city ,u.user_name, b.ticket_count, t.theatre_name,
   rank() over (partition by t.theatre_name order by b.ticket_count desc) as rank_tcount_theatre
from bookings b 
join user u on b.user_id = u.user_id
join shows s on s.show_id = b.show_id
join theatre t on s.theatre_id = t.theatre_id


-- 43. Rank tickets across cities according to gender
Select  u.gender, t.city ,u.user_name, b.ticket_count,
   dense_rank() over (partition by u.gender order by b.ticket_count desc) as rank_tcount_gender
from bookings b 
join user u on b.user_id = u.user_id
join shows s on b.show_id= s.show_id
join theatre t on t.theatre_id = s.theatre_id


-- 44. Ranking Users by Movie in Each Genre
select u.user_id, u.user_name, m.genre,
  dense_rank() over (order by m.genre) as rank_user_genre
from user u 
join bookings b on b.user_id= u.user_id
join movies m on m.movie_id= b.movie_id 


select * from user 

-- 45. Write a query to swap genders
# using case
update user set gender= case
    when gender = 'Female' then  'Male'
    when gender = 'Male' then  'Female'
end

select user_name , gender from user 

-- 46. Create a View where movie type is IMAX
create view IMAX_ShowDetails as (
select m.movie_name ,t.theatre_name ,t.city,s.show_date ,s.start_time
from theatre t
join shows s on t.theatre_id = s.theatre_id
join movies m on m.movie_id = s.movie_id
where m.type = 'IMAX'
)

select * from IMAX_ShowDetails



-- Stored procedures (executes when called)
-- 47. Stored procedures to Get Theatre Details by City

DELIMITER //
create procedure TheatreDetailsByCity(IN CITYNAME varchar(100))
begin
  select t.theatre_name, t.city
  from theatre t
  where t.city = CITYNAME;
end //

call TheatreDetailsByCity('pune')
call TheatreDetailsByCity('kolkata')




-- 48. Get all User Booking Details

DELIMITER //
create procedure GetUserBookingDetails(IN USERID INT )
begin
  select u.user_name, 
         m.movie_name,
		 m.type ,
         s.show_date,
         t.theatre_name,
         b.ticket_count 
  from user u
  join bookings b on u.user_id= b.user_id
  join movies  m  on b.movie_id= m.movie_id
  join shows  s   on b.show_id= s.show_id
  join theatre t on s.theatre_id = t.theatre_id
  where u.user_id = USERID;
end //

DELIMITER;
call GetUserBookingDetails(3001)

call GetUserBookingDetails(3005)
