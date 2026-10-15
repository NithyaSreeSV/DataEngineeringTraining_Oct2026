import pandas as pd

# Using orders.csv:

# 61. Read the CSV into a Pandas DataFrame.
orders = pd.read_csv("orders.csv")

# 62. Display first 5 rows.
print("First five rows:\n", orders.head())

# 63. Display column names and datatypes.
print("Columns and types:\n", orders.dtypes)

# 64. Display shape of the DataFrame.
print("Shape:", orders.shape)

# 65. Filter only Delivered orders using query().
print("Delivered orders:\n", orders.query("status == 'Delivered'"))

# 66. Filter orders where quantity is greater than 2.
high_quant_orders = orders[orders["quantity"] > 2]
print("Quantity above 2:\n", high_quant_orders)

# 67. Calculate a new column: order_value = quantity × unit_price
orders["order_value"] = orders["quantity"] * orders["unit_price"]

# 68. Count orders by status.
print("Orders by status:\n", orders["status"].value_counts())

# 69. Convert order_date to datetime.
# 70. Create a month column.
orders["order_date"] = pd.to_datetime(orders["order_date"])
orders["month"] = orders["order_date"].dt.month

# 71. Find order count by month and status.
print("Count by month and status:\n", orders.groupby(["month", "status"]).size())

# 72. Find total order value by category.
print("Total order value by category:\n", orders.groupby("category")["order_value"].sum())

# 73. Find average order value by category.
print("Average order value by category:\n", orders.groupby("category")["order_value"].mean())

# 74. Sort orders by order value descending.
print("Sorted by order value:\n", orders.sort_values("order_value", ascending=False))