---
title: Airports Dashboard
---


Add a map of all the airports that are in the dataset. 

```sql airports_map

-- Join the latitude and longitude of the airports with the airlines table
WITH airlines_total AS (
    SELECT 
        airport,
        airport_name,
        SUM(arr_flights) as sum_arr_flights
    FROM airlines
    GROUP BY airport, airport_name
)
-- join airlines_total with airports
SELECT
    airports.name as airport_iata,
    airlines_total.airport_name as airport_name,
    airlines_total.sum_arr_flights as total_amount_of_incoming_flights,
    airports.latitude_deg as lat,
    airports.longitude_deg as long
FROM airlines_total
JOIN airports
ON airlines_total.airport = airports.iata_code
WHERE airports.latitude_deg IS NOT NULL AND airports.longitude_deg IS NOT NULL
```

<BubbleMap 
    data={airports_map} 
    lat=lat
    long=long 
    value=total_amount_of_incoming_flights 
    size=total_amount_of_incoming_flights 
    pointName=airport_name
/>



## Which airport had the most amout of flights arriving for all years?

``` sql airports_top_10

SELECT * FROM ${airports_map}
ORDER BY total_amount_of_incoming_flights DESC
LIMIT 10
```


<BarChart
    data={airports_top_10}
    title="Airports with the most arrivals"
    x=airport_name
    y=total_amount_of_incoming_flights
/>

## Which airport had the most amout of flights cancelled?

```sql airport_most_cancellations

SELECT 
airport_name, 
SUM(arr_cancelled) as total_amount_of_fligths_cancelled

FROM airlines

GROUP BY airport_name
ORDER BY total_amount_of_fligths_cancelled DESC

LIMIT 10

```

<BarChart
    data={airport_most_cancellations}
    title="Airports with the most amount of cancellations in total"
    x=airport_name
    y=total_amount_of_fligths_cancelled
/>

```sql airport_most_cancelations_percentage

SELECT 
airport_name, 
SUM(arr_cancelled) / SUM(arr_flights) *100 as cancelled_flights_percentage

FROM airlines

GROUP BY airport_name
ORDER BY cancelled_flights_percentage DESC

LIMIT 10
```

<BarChart
    data={airport_most_cancelations_percentage}
    title="Airports with the most amount of cancellations in percentage to arrival flights"
    x=airport_name
    y=cancelled_flights_percentage
/>

