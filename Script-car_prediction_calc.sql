
--which of parameters is the most important for price?
select regr_r2(price, carlength) as r2_carlenght, 'carlenght' from car_price_cleaned union all
select regr_r2(price, carwidth) r2_carwidth,  'carwidth' from car_price_cleaned union all
select regr_r2(price, carheight) as r2_carheight,  'carheight' from car_price_cleaned union all
select regr_r2(price, curbweight) as r2_curbweight,  'curbweight' from car_price_cleaned union all
select regr_r2(price, enginesize) as r2_enginesize,  'enginesize' from car_price_cleaned union all
select regr_r2(price, wheelbase_squared) as r2_wheelbase_squared,  'wheelbase_squared' from car_price_cleaned union all
select regr_r2(price, peakrpm) as r2_peakrpm,  'peakrpm' from car_price_cleaned union all
select regr_r2(price, citympg) as r2_citympg,  'r2_citympg' from car_price_cleaned union all
select regr_r2(price, highwaympg) as r2_highwaympg,  'r2_highwaympg' from car_price_cleaned union all
select regr_r2(price, power_to_weight_ratio) as r2_power_to_weight_ratio,  'r2_power_to_weight_ratio' from car_price_cleaned union all
select regr_r2(price, compressionratio) as r2_compressionratio,  'compressionratio' from car_price_cleaned union all
select regr_r2(price, stroke) as r2_stroke,  'stroke' from car_price_cleaned union all
select regr_r2(price, cylindernumber) as r2_cylindernumber,  'cylindernumber' from car_price_cleaned order by 1 desc;

--creating a calculator of price of car with selected car features:
select 
(((slope_carlength * 1 + intercept_carlength) * r2_carlenght)+ --finding price with selected lenght
((slope_carwidth *0.98 + intercept_carwidth) * r2_carwidth)+ --finding price with selected width
((slope_carheight *0.90 + intercept_carheight) * r2_carheight)+ --finding price with selected height
((slope_curbweight *1.44 + intercept_curbweight) * r2_curbweight)+ --finding price with selected curb weight
((slope_enginesize *1.68 + intercept_enginesize) * r2_enginesize)+ --finding price with selected engine size
((slope_wheelbase_squared *9 + intercept_wheelbase_squared) * r2_wheelbase_squared)+ --finding price with selected wheelbase
((slope_peakrpm *0.61 + intercept_peakrpm) * r2_peakrpm)+ --finding price with selected peak rpm
((slope_citympg *1.5 + intercept_citympg) * r2_citympg)+ --finding price with selected city mpg
((slope_highwaympg *1.8 + intercept_highwaympg) * r2_highwaympg)+ --finding price with selected hightway mpg
((slope_power_to_weight_ratio *0.04 + intercept_power_to_weight_ratio) * r2_power_to_weight_ratio)+ --finding price with selected division wheelpower to weight
((slope_compressionratio *0.3 + intercept_compressionratio) * r2_compressionratio)+ --finding price with selected compression ratio
((slope_stroke *0.2 + intercept_stroke) * r2_stroke)+ --finding price with selected stroke ratio
((slope_cylindernumber *3 + intercept_cylindernumber) * r2_cylindernumber)) --finding price with selected cylinder number
/(r2_carlenght+r2_carwidth+r2_carheight+ r2_curbweight+r2_enginesize+r2_wheelbase_squared+r2_peakrpm+r2_citympg+r2_highwaympg+r2_power_to_weight_ratio) --augmentation of all R2 coefficients of determination of selected parameters for future division
as prediction_price --finding weighted arithmetic mean
from (select --finding the intercept, slope and R2, where independent variables is selected parameters and dependent variable is price of cars
regr_intercept (price, carlength) as intercept_carlength, regr_slope (price, carlength) as slope_carlength, regr_r2(price, carlength) as r2_carlenght,
regr_intercept (price, carwidth) as intercept_carwidth, regr_slope (price, carwidth) slope_carwidth, regr_r2(price, carwidth) r2_carwidth,
regr_intercept (price, carheight) as intercept_carheight, regr_slope (price, carheight) as slope_carheight, regr_r2(price, carheight) as r2_carheight,
regr_intercept (price, curbweight) as intercept_curbweight, regr_slope (price, curbweight) as slope_curbweight, regr_r2(price, curbweight) as r2_curbweight,
regr_intercept (price, enginesize) as intercept_enginesize, regr_slope (price, enginesize) as slope_enginesize, regr_r2(price, enginesize) as r2_enginesize,
regr_intercept (price, wheelbase_squared) as intercept_wheelbase_squared, regr_slope (price, wheelbase_squared) as slope_wheelbase_squared, regr_r2(price, wheelbase_squared) as r2_wheelbase_squared,
regr_intercept (price, peakrpm) as intercept_peakrpm, regr_slope (price, peakrpm) as slope_peakrpm, regr_r2(price, peakrpm) as r2_peakrpm,
regr_intercept (price, citympg) as intercept_citympg, regr_slope (price, citympg) as slope_citympg, regr_r2(price, citympg) as r2_citympg, 
regr_intercept (price, highwaympg) as intercept_highwaympg, regr_slope (price, highwaympg) as slope_highwaympg, regr_r2(price, highwaympg) as r2_highwaympg,
regr_intercept (price, power_to_weight_ratio) as intercept_power_to_weight_ratio, regr_slope (price, power_to_weight_ratio) as slope_power_to_weight_ratio, regr_r2(price, power_to_weight_ratio) as r2_power_to_weight_ratio,
regr_intercept (price, compressionratio) as intercept_compressionratio, regr_slope (price, compressionratio) as slope_compressionratio, regr_r2(price, compressionratio) as r2_compressionratio,
regr_intercept (price, stroke) as intercept_stroke, regr_slope (price, stroke) as slope_stroke, regr_r2(price, stroke) as r2_stroke,
regr_intercept (price, cylindernumber) as intercept_cylindernumber, regr_slope (price, cylindernumber) as slope_cylindernumber, regr_r2(price, cylindernumber) as r2_cylindernumber
from car_price_cleaned) sq;

