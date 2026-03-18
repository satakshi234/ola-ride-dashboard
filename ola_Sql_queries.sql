#1. Retreive all  successull booking
Create View Successful_Bookings As
select * from bookings
where Booking_Status = 'Success';


select * from Successful_Bookings;
#2.Find the average ride distance  for each vehicle type
Create View ride_distance_for_each_vehicle as
select  Vehicle_Type, avg(Ride_Distance) from bookings
group by Vehicle_Type;


#3. Get the total number of canceled rides by customers
Create view canceled_rides_by_customers as
select count(*) from bookings
where Booking_status='Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides
Create View top_5_customers as
select Customer_ID,count(Booking_ID) as total_rides from bookings
group by Customer_ID
Order by total_rides desc
limit 5;


#5. Get the number of rides canceled by drivers due to personal and car-related issues
create view Rides_Canceled_by_Drivers_P_C_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';


#6. Find the max and min driver ratings for Price Sedan bookings
create view Max_Min_Driver_Rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type='Prime_Sedan';



#7.Retreive all rides where payment was made using UPI
create view UPI_Payment as
select * from bookings
where Payment_Method='UPI';

#8.Find the average customer rating per vehicle type
create view AVG_Cust_Rating as
select Vehicle_Type,avg(Customer_Rating) from bookings
group by Vehicle_Type;


#9. Caculate the total booking value of rides completed successfully
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value from bookings
where Booking_Status='Success';


#10. list all incomplete rides along with the reason
create view Incomplete_Rides_Reason as
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides='Yes'

