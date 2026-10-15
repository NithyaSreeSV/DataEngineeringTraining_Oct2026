import csv

# Using: registrations.csv

# 53. Read the file using the csv module.
with open("registrations.csv", "r") as file:
    reader = csv.reader(file)

# 54. Store records in a Python list.
with open("registrations.csv", "r") as file:
    registrations_df = list(csv.DictReader(file))

# 55. Display only Confirmed registrations.
print("Confirmed registrations:", [r["registration_id"] for r in registrations_df if r["status"] == "Confirmed"])

# 56. Display registrations from Hyderabad.
print("Registrations from Hyderabad:", [r["registration_id"] for r in registrations_df if r["city"] == "Hyderabad"])

# 57. Convert amount into a numeric datatype.
for r in registrations_df:
    r["amount"] = float(r["amount"])

# 58. Find registrations where amount exceeds ₹7,000.
print("Amounts above Rs.7000:", [r["registration_id"] for r in registrations_df if r["amount"] > 7000])

# 59. Calculate total registration amount.
total_amount = 0
for r in registrations_df:
    total_amount += r["amount"]

print("Total registration amount:", total_amount)

# 60. Extract all cities and display unique cities.
print("Unique cities:", set(r["city"] for r in registrations_df))
