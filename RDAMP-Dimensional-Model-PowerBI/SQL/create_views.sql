CREATE VIEW vw_product_seasonality AS
SELECT 
    d.month_name, p.product_name, SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.order_date = d.order_date
GROUP BY d.month_name, p.product_name;

CREATE VIEW vw_discount_impact AS
SELECT 
    discount_amount, SUM(profit) AS total_profit
FROM fact_sales
GROUP BY discount_amount;

CREATE VIEW vw_customer_order_patterns AS
SELECT 
    c.customer_id, COUNT(f.order_id) AS order_count,
    AVG(f.sales_amount) AS avg_order_value, SUM(f.profit) AS total_profit
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id;