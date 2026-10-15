import pandas as pd
import numpy as np
# Read: customers.csv, orders.csv
customers = pd.read_csv("customers.csv")
orders = pd.read_csv("orders.csv")
orders["order_value"] = orders["quantity"] * orders["unit_price"] # Used since separate file from pandas data processing

# 75. Perform an inner join using customer_id.
joined = orders.merge(customers, on="customer_id", how="inner")

# 76. Display: order ID, customer name, city, product, status, order value
print("Joined data:\n", joined[["order_id", "customer_name", "city", "product", "status", "order_value"]])

# 77. Display only Delivered orders from Hyderabad.
print("Delivered orders from Hyderabad:\n", joined.query("status == 'Delivered' and city == 'Hyderabad'"))

# 78. Calculate by city: total orders, total sales, average order value
city_summary = joined.groupby("city").agg(total_orders=("order_id", "count"), total_sales=("order_value", "sum"), average_order_value=("order_value", "mean")).reset_index()
print("City sales summary:\n", city_summary)

# 79. Sort city results by total sales descending.
city_summary = city_summary.sort_values("total_sales", ascending=False)

# 80. Write the result to: city_sales_summary.csv
city_summary.to_csv("city_sales_summary.csv", index=False)

# 81. Write the same result to: city_sales_summary.json using record-oriented JSON.
city_summary.to_json("city_sales_summary.json", orient="records", indent=4)

# Numpy Pandas Enrichment

# Using the joined DataFrame:
# 82. Create a column order_size using NumPy: order_value >= 50000 → High, order_value >= 15000 → Medium, otherwise → Low
joined["order_size"] = np.select([joined["order_value"] >= 50000, joined["order_value"] >= 15000], ["High", "Medium"], default="Low")

# 83. Create a new column: priority_customer where Corporate customers are marked Priority , others Normal.
joined["priority_customer"] = np.where(joined["segment"] == "Corporate", "Priority", "Normal")

# 84. Save the enriched dataset as: enriched_orders.csv
joined.to_csv("enriched_orders.csv", index=False)