CREATE DATABASE hotel_bookings_database;

USE hotel_bookings_database;

CREATE TABLE hotel_booking (
hotel text,
is_canceled	float,
lead_time float,	
arrival_date_year float,	
arrival_date_month text,
arrival_date_week_number float,	
arrival_date_day_of_month float,
stays_in_weekend_nights	float,
stays_in_week_nights float,
adults float,
children float,
babies float,
meal text,
country text,
market_segment text,
distribution_channel text,
is_repeated_guest bool,
previous_cancellations bool,
previous_bookings_not_canceled bool,
reserved_room_type text,
assigned_room_type text, 
booking_changes	float,
deposit_type text,
agent text,
company text,
days_in_waiting_list float,
customer_type text,
adr	float,
required_car_parking_spaces	float,
total_of_special_requests float,
reservation_status text,
reservation_status_date date
);

SELECT *
FROM hotel_booking;













