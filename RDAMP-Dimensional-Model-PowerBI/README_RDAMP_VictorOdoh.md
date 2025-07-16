# RDAMP Task 2 – Dimensional Modeling & Power BI Reporting
**Author**: Victor Odoh

## 📊 Project Overview
This project involves transforming retail data from Ace Superstore into a dimensional star schema using SQL. The cleaned data is modeled for scalable analytics, with views created to support an interactive Power BI dashboard.

---

## ⭐ Star Schema Overview

![Schema Diagram](screenshots/schema_diagram.png)

### Fact Table
- **fact_sales**: Stores transactional sales data with foreign keys linking to all dimension tables. Contains sales, profit, quantity, and discounts.

### Dimension Tables
- **dim_customer**: Customer data with postal and city info.
- **dim_product**: Product details including name and sub-category.
- **dim_category**: Category lookup for products.
- **dim_location**: Region-level location data.
- **dim_date**: Order date broken into year, month, quarter.
- **dim_segment**: Customer segment information.
- **dim_order_mode**: In-store or online sales channel.

---

## 🛠️ SQL Setup Instructions
1. Run `create_tables.sql` to generate the schema.
2. Load your dimension data using `populate_dimensions.sql`.
3. Insert fact data using `populate_fact_table.sql`.
4. Execute `create_views.sql` to generate analytical views.
5. Use `queries.sql` for reusable business insights.

---

## 📈 Power BI Integration
- Connect Power BI to your SQL database (PostgreSQL, MySQL, or SQL Server).
- Import views such as:
  - `vw_product_seasonality`
  - `vw_discount_impact`
  - `vw_customer_order_patterns`

### Dashboard Features
1. **Discount vs Profit Analysis** (scatter or slope chart)
2. **Product Seasonality Trends** (heatmap)
3. **Order Value by Channel/Segment** (combo chart)
4. **Top 10 Customers by Profit** (bar chart)
5. **Category Ranking by Region** (matrix or bar)

---

## 📁 Repository Structure

```plaintext
RDAMP-Dimensional-Model-PowerBI/
├── sql/
│   ├── create_tables.sql
│   ├── populate_dimensions.sql
│   ├── populate_fact_table.sql
│   ├── create_views.sql
│   └── queries.sql
├── powerbi/
│   └── AceSuperstore_Dashboard.pbix
├── screenshots/
│   └── schema_diagram.png
