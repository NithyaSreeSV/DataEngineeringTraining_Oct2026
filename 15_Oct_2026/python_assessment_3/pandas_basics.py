import pandas as pd

# Using registrations.csv:

# 80. Read the file into a DataFrame.
registrations_df = pd.read_csv("registrations.csv")

# 81. Display: first 5 rows, last 5 rows, shape, columns, datatypes
print("First 5 rows:\n", registrations_df.head())
print("Last 5 rows:\n", registrations_df.tail())
print("Shape:", registrations_df.shape)
print("Columns:", registrations_df.columns.tolist())
print("Data types:\n", registrations_df.dtypes)

# 82. Display only: attendee_name, city, status, amount
print(registrations_df[["attendee_name", "city", "status", "amount"]])

# 83. Use query() to find Confirmed registrations.
print("Confirmed query:\n", registrations_df.query("status == 'Confirmed'"))

# 84. Find registrations whose amount exceeds ₹6,000.
print("Amount above ₹6000:\n", registrations_df.query("amount > 6000"))

# 85. Find Confirmed registrations from Hyderabad.
print("Confirmed from Hyderabad:\n", registrations_df.query("status == 'Confirmed' and city == 'Hyderabad'"))

# 86. Count registrations by status.
print("Count by status:\n", registrations_df["status"].value_counts())

# 87. Find total amount by status.
print("Total amount by status:\n", registrations_df.groupby("status")["amount"].sum())

# 88. Find average amount by city.
print("Average amount by city:\n", registrations_df.groupby("city")["amount"].mean())
