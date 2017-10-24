--  1. Get all customers and their addresses
SELECT * FROM
"customers" JOIN "addresses" ON
"customers"."id" = "addresses"."customer_id";

--  2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON
orders."id" = line_items."order_id"
JOIN products ON
products."id" = line_items."product_id";;

--	3.	Which warehouses have cheetos?
SELECT warehouse."warehouse", products."description" FROM warehouse
JOIN warehouse_product ON 
warehouse."id" = warehouse_product."warehouse_id"
JOIN products ON
warehouse_product."product_id" = products."id"
WHERE products."description" = 'cheetos';

--	4.	Which warehouses have diet pepsi?
SELECT warehouse."warehouse", products."description" FROM warehouse
JOIN warehouse_product ON 
warehouse."id" = warehouse_product."warehouse_id"
JOIN products ON
warehouse_product."product_id" = products."id"
WHERE products."description" = 'diet pepsi';

--	5.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name","customers"."last_name",COUNT("orders"."id") FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "customers"."id";

--	6.	How many customers do we have?
SELECT COUNT(*) FROM "customers";

--	7.	How many products do we carry?
SELECT COUNT(*) FROM "products";

--	8.	What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi'
GROUP BY "products"."description";