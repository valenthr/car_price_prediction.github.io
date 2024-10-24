# Car price prediction

## Tools

SQL (PostgreSQL), Looker Studio

## About

The project was created to calculate the approximate price of new cars based on thirteen indicators with data from the [Kaggle dataset](https://www.kaggle.com/datasets/syedfaizanalii/car-price-dataset-cleaned)

## Purposes of the project

The main goal of this project is to understand which technical characteristics have the greatest influence on the price of cars and how to calculate the price of a car based on its characteristics

## Parameters for calculating the price

1. Carlength - length of the car.
2. Carwidth - width of the car.
3. Carheight - height of the car.
4. Curbweight - the weight of the car including a full tank of fuel and all standard equipment.
5. Enginesize - the volume of fuel and air that can be pushed through a car's cylinders.
6. Wheelbase_squared - area of the car.
7. Peakrpm - the maximum rotational speed at which an engine or motor operates efficiently (revolutions per minute). In this dataset are introdused as deviation from average value(4000 RPM).
8. Citympg - the fuel efficiency of a car driving in urban conditions, typically characterized by stop-and-go traffic and lower speeds.
9. Highwaympg - a fuel efficiency during highway driving.
10. Power_to_weight_ratio - comparisation a vehicle's engine power to its weight.
11. Compressionratio - the ratio of the maximum volume of a cylinder in an engine to the minimum volume of that cylinder when the piston is at the top of its stroke.
12. Stroke - the ratio of the stroke length (the distance the piston travels within the cylinder) to the bore diameter (the internal diameter of the cylinder).
13. Cylindernumber - the total count of cylinders in an engine.
    
## Method of calculating the ratio of dependence of the price to the indicators

As an indicator of dependence was taken the coefficient of determination R²(was performed by SQL query in the SQL file attached above). Result are [there](https://lookerstudio.google.com/reporting/6731df5c-3df2-4edb-afac-855b3a060e72).

## Calculating the price by parameters

Calculating the price by parameters performs by SQL query in the SQL file attached above (all solution is in one query - for example I selected standart values, but it's optional) based on:
1. The formula of the linear regression у = slope * x + intercept, where x - parameter (independent value), 
y - price (dependent value), slope - the ratio of the vertical change to the horizontal change, intercept - the point where the line crosses the y-axis.
2. Weighted arithmetic mean for extracting the final price, where final price x = (w_{1}×x_{1} + w_{2}×x_{2} +...+w_{13}×x_{13})/(w_{1} +w_{2}+...+w_{13})
where x_{1-13} - result of the first formula for each parameters, w_{1-13} - R² for each parameter.

