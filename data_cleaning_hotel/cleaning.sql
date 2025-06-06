USE hotel_bookings_database; 

-- Removing duplicates from our dataset --

SELECT *
FROM hotel_booking;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY `hotel`, `is_canceled`, `lead_time`, `arrival_date_year`, `arrival_date_month`, `arrival_date_week_number`, 
`arrival_date_day_of_month`, `stays_in_weekend_nights`, `stays_in_week_nights`, `adults`, `children`, `babies`, `meal`, `country`, 
`market_segment`, `distribution_channel`, `is_repeated_guest`, `previous_cancellations`, `previous_bookings_not_canceled`, `reserved_room_type`, 
`assigned_room_type`, `booking_changes`, `deposit_type`, `agent`, `company`, `days_in_waiting_list`, `customer_type`, `adr`, `required_car_parking_spaces`, 
`total_of_special_requests`, `reservation_status`, `reservation_status_date`) AS row_num
FROM hotel_booking;

CREATE TABLE `hotel_booking_num` (
  `hotel` text,
  `is_canceled` float DEFAULT NULL,
  `lead_time` float DEFAULT NULL,
  `arrival_date_year` float DEFAULT NULL,
  `arrival_date_month` text,
  `arrival_date_week_number` float DEFAULT NULL,
  `arrival_date_day_of_month` float DEFAULT NULL,
  `stays_in_weekend_nights` float DEFAULT NULL,
  `stays_in_week_nights` float DEFAULT NULL,
  `adults` float DEFAULT NULL,
  `children` float DEFAULT NULL,
  `babies` float DEFAULT NULL,
  `meal` text,
  `country` text,
  `market_segment` text,
  `distribution_channel` text,
  `is_repeated_guest` tinyint(1) DEFAULT NULL,
  `previous_cancellations` tinyint(1) DEFAULT NULL,
  `previous_bookings_not_canceled` tinyint(1) DEFAULT NULL,
  `reserved_room_type` text,
  `assigned_room_type` text,
  `booking_changes` float DEFAULT NULL,
  `deposit_type` text,
  `agent` text,
  `company` text,
  `days_in_waiting_list` float DEFAULT NULL,
  `customer_type` text,
  `adr` float DEFAULT NULL,
  `required_car_parking_spaces` float DEFAULT NULL,
  `total_of_special_requests` float DEFAULT NULL,
  `reservation_status` text,
  `reservation_status_date` date DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Include [`row_num` INT] to a duplicated table so then we can drop the duplicates -- 

SELECT *
FROM hotel_booking_num
WHERE row_num > 1;

INSERT INTO hotel_booking_num
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY hotel, is_canceled, lead_time, arrival_date_year, arrival_date_month,
arrival_date_week_number, arrival_date_day_of_month, stays_in_weekend_nights, 
stays_in_week_nights, adults, children, babies, meal, country, market_segment, 
distribution_channel, is_repeated_guest, previous_cancellations, 
previous_bookings_not_canceled, reserved_room_type, 
assigned_room_type, booking_changes, deposit_type, agent, company, 
days_in_waiting_list, customer_type, adr, required_car_parking_spaces, 
total_of_special_requests, reservation_status, reservation_status_date) AS row_num
FROM hotel_booking;

-- This inserts the original table's contents into our newly made table --

SELECT *
FROM hotel_booking_num
WHERE row_num > 1;

DELETE
FROM hotel_booking_num
WHERE row_num > 1;

SELECT *
FROM hotel_booking_num
WHERE row_num > 1; 
-- Now there should be no duplicates: we should be presented with a blank table

SELECT *
FROM hotel_booking_num








