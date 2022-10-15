/*Is our hotel revenue growing by year ? (we have two types so it would be good to 
#segment revenue by hotel type)*/

with hotels as (
select * from portfolioproject.hotel_revenue_historical_full_2018
UNION
select * from portfolioproject.hotel_revenue_historical_full_2019
UNION
select * from portfolioproject.hotel_revenue_historical_full_2020)

SELECT 
    arrival_date_year,
    hotel,
    SUM((stays_in_weekend_nights + stays_in_week_nights) * adr) AS revenue
FROM
    hotels
GROUP BY arrival_date_year , hotel;

/*Join all the tables to one table*/

with hotels as (
select * from portfolioproject.hotel_revenue_historical_full_2018
UNION
select * from portfolioproject.hotel_revenue_historical_full_2019
UNION
select * from portfolioproject.hotel_revenue_historical_full_2020)

SELECT 
    *
FROM
    hotels
        LEFT JOIN
    portfolioproject.market_segment ON hotels.market_segment = market_segment.market_segment
        LEFT JOIN
    portfolioproject.meal_cost ON hotels.meal = meal_cost.meal;