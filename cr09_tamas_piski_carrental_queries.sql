# Using databsase carrental
USE cr05_tamas_piski_carrental;

# First script getting all the rents
SELECT start_date, end_date, car 
FROM reservations 
ORDER BY start_date ASC;

# Second script getting the same thing but making the car name visible with JOIN
SELECT start_date, end_date, car_brand, car_model 
FROM reservations AS r
JOIN cars AS c ON r.car = c.idcars
ORDER BY start_date ASC;

# Third script shows the rents we had in the past
SELECT * 
FROM rents
ORDER BY start_date ASC;

# The result table of the third script is not too informative so let's join multiple tables
SELECT start_date, end_date, client_name, car_brand, duedate, extra, price_name
FROM rents AS r
JOIN clients AS c ON r.client = c.idclients 
JOIN cars AS cr ON cr.idcars = r.car
JOIN invoices AS i ON i.client = r.client
JOIN extras AS e ON r.extra_service = e.idextras
JOIN prices AS p ON p.priceid = r.price
ORDER BY start_date ASC;

# We can make it even better by naming the columns
SELECT start_date AS "Start date", end_date AS "End date", client_name AS "Client name", car_brand AS "Brand", duedate AS "Invoice due to date", extra AS "Extras", price_name AS "Customer category"
FROM rents AS r
JOIN clients AS c ON r.client = c.idclients 
JOIN cars AS cr ON cr.idcars = r.car
JOIN invoices AS i ON i.client = r.client
JOIN extras AS e ON r.extra_service = e.idextras
JOIN prices AS p ON p.priceid = r.price  
ORDER BY start_date ASC;

# Now let's see the invoices 
SELECT client_name AS "Client", duedate AS "Invoice due to date", sum AS "Total", p.payment_method AS "Payment method" 
FROM invoices AS i
JOIN clients AS c ON i.client = c.idclients
JOIN payments AS py ON i.payment = py.idpayments
JOIN payment_methods AS p ON p.idpayment_methods = py.payment_method;

# Filter the ones which are unpaid
SELECT client_name AS "Client", duedate AS "Invoice due to date", sum AS "Total", p.payment_method AS "Payment method" 
FROM invoices AS i
JOIN clients AS c ON i.client = c.idclients
JOIN payments AS py ON i.payment = py.idpayments
JOIN payment_methods AS p ON p.idpayment_methods = py.payment_method
WHERE py.payment_status = 0;

# Let's say our staff wants to know which cars need to be filled with petrol
SELECT car_model AS "Car", gas_tank_full AS "Filled up" 
FROM cars AS c
JOIN maintenances AS m ON c.maintenance_id = m.idmaintenance
WHERE gas_tank_full = 0;

# We can list the reservations for the future as well
SELECT start_date, end_date, car_brand, extra
FROM reservations AS r
JOIN cars AS c ON r.car = c.idcars
JOIN extras AS e ON r.extras = e.idextras
ORDER BY start_date ASC;

# Finally let's show if there are any cars in Vienna
SELECT car_brand AS "Car", location_name AS City
FROM cars AS c
JOIN location AS l ON c.return_location_id = l.idlocation
WHERE idlocation = 1;