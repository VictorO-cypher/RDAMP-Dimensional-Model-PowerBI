-- RDAMP Task 2 | Victor Odoh
-- File: create_tables.sql

-- Drop tables if they exist (optional for clean runs)
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_category;
DROP TABLE IF EXISTS dim_segment;
DROP TABLE IF EXISTS dim_order_mode;

-- Dimension: Customer
CREATE TABLE dim_customer (
    customer_id VARCHAR(50) PRIMARY KEY,
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    category_id VARCHAR(50),
    sub_category VARCHAR(100)
);

-- Dimension: Category
CREATE TABLE dim_category (
    category_id VARCHAR(50) PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Dimension: Location (Region)
CREATE TABLE dim_location (
    region_id VARCHAR(50) PRIMARY KEY,
    region_name VARCHAR(100)
);

-- Dimension: Date
CREATE TABLE dim_date (
    order_date DATE PRIMARY KEY,
    year INT,
    month_name VARCHAR(20),
    quarter VARCHAR(10)
);

-- Dimension: Segment
CREATE TABLE dim_segment (
    segment_id VARCHAR(50) PRIMARY KEY,
    segment_name VARCHAR(100)
);

-- Dimension: Order Mode
CREATE TABLE dim_order_mode (
    order_mode_id VARCHAR(50) PRIMARY KEY,
    mode_name VARCHAR(50)
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    region_id VARCHAR(50),
    order_date DATE,
    order_mode_id VARCHAR(50),
    segment_id VARCHAR(50),
    quantity INT,
    cost_price FLOAT,
    sales_amount FLOAT,
    profit FLOAT,
    discount_amount FLOAT,
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (region_id) REFERENCES dim_location(region_id),
    FOREIGN KEY (order_date) REFERENCES dim_date(order_date),
    FOREIGN KEY (order_mode_id) REFERENCES dim_order_mode(order_mode_id),
    FOREIGN KEY (segment_id) REFERENCES dim_segment(segment_id)
);