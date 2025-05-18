---
title: Airline Dashboard
---

## Which airlines had the most amount of flights?

<ButtonGroup name=figure_type>
    <ButtonGroupItem valueLabel="Bar chart" value="barchart" default/>
    <ButtonGroupItem valueLabel="Pie chart" value="piechart"/>
</ButtonGroup>

<!-- Show the top 10 airlines by the amount of scheduled flights -->
```sql airlines_most_amount_flights

SELECT 
carrier_name, 
SUM(arr_flights) as total_amount_of_flights

FROM airlines

GROUP BY carrier_name
ORDER BY total_amount_of_flights DESC

LIMIT 10
```


```sql pie_data
select carrier_name as name, total_amount_of_flights as value
from ${airlines_most_amount_flights}
```




{#if inputs.figure_type == "barchart"}

<BarChart
    data={airlines_most_amount_flights}
    title="Top 10 airlines that had the most amount of flights"
    x=carrier_name
    y=total_amount_of_flights
/>


{:else }

<ECharts config={
    {
        series: [
        {
        type: 'pie',
        data: [...pie_data],
        }
    ]
    }
    }
/>

{/if}



## Which airlines had the most amount of cancelled flights?

<!-- Show the top 10 airlines by the amount of cancelled flights -->
```sql airlines_most_amount_of_cancelled_flights

SELECT 
carrier_name, 
SUM(arr_cancelled) as total_amm_cancelled_flights

FROM airlines

GROUP BY carrier_name
ORDER BY total_amm_cancelled_flights DESC

LIMIT 10
```

<BarChart
    data={airlines_most_amount_of_cancelled_flights}
    title="Top 10 airlines that had the most amount of cancelled flights"
    x=carrier_name
    y=total_amm_cancelled_flights
/>



## Which airline had the most amount of delays (15 or more minutes)?

```sql airlines_15_or_more_mins_delay

SELECT
    carrier_name,
    SUM(arr_del15) as delay_15_or_more_mins
    FROM airlines
    GROUP BY carrier_name
    ORDER BY delay_15_or_more_mins DESC
    LIMIT 10
```
<BarChart
    data={airlines_15_or_more_mins_delay}
    title="Top 10 airlines that had the most amount amount of delays"
    x=carrier_name
    y=delay_15_or_more_mins
/>