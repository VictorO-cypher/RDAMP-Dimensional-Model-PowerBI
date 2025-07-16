-- 1. Total sales by region
SELECT l.region_name, SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_location l ON f.region_id = l.region_id
GROUP BY l.region_name;

-- 2. Profit by product category
SELECT c.category_name, SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_category c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 3. Average discount by segment
SELECT s.segment_name, AVG(f.discount_amount) AS avg_discount
FROM fact_sales f
JOIN dim_segment s ON f.segment_id = s.segment_id
GROUP BY s.segment_name;

-- 4. Online vs In-Store profit
SELECT o.mode_name, SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_order_mode o ON f.order_mode_id = o.order_mode_id
GROUP BY o.mode_name;

-- 5. Top 5 customers by total sales
SELECT c.customer_id, SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_sales DESC
LIMIT 5;