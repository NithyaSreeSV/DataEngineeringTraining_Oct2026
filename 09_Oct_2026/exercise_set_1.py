import csv

#Data setup
csv_content = """shipment_id,customer,city,weight,status,cost
S101,Alpha Stores,Hyderabad,12.5,Delivered,850
S102,Metro Mart,Mumbai,8.2,In Transit,620
S103,Fresh Foods,Hyderabad,15.0,Delivered,1100
S104,Quick Shop,Pune,5.5,Pending,450
S105,Urban Retail,Mumbai,20.0,Delivered,1450
S106,Daily Needs,Delhi,9.8,In Transit,700
S107,Smart Bazaar,Hyderabad,7.5,Pending,550
S108,Green Market,Delhi,18.2,Delivered,1300"""

with open("shipments.csv", "w", newline="") as file:
    file.write(csv_content.strip())

# 1. Read shipments.csv using Python's csv module.
# 2. Store all records inside a Python list.
shipments = []
with open("shipments.csv", "r") as file:
    reader = csv.reader(file)
    header = next(reader)  # Skip or store the header row
    for row in reader:
        shipments.append(row)

# 3. Display the complete list.
print(shipments)

# 4. Display only: shipment ID, customer, status.
for s in shipments:
    print(f"ID: {s[0]}, Customer: {s[1]}, Status: {s[4]}")

# 5. Convert weight and cost from strings to numeric values.
for s in shipments:
    s[3] = float(s[3])
    s[5] = float(s[5])

# 6. Calculate the total shipping cost.
total_cost = sum(s[5] for s in shipments)
print(f"Total cost: {total_cost}")

# 7. Find shipments whose cost is greater than 700.
high_cost_shipments = [s for s in shipments if s[5] > 700]
for s in high_cost_shipments:
    print(s)

# 8. Use filter() and lambda to display only Delivered shipments.
delivered = list(filter(lambda s: s[4] == "Delivered", shipments))
for d in delivered:
    print(d)

# 9. Use filter() and lambda to find shipments weighing more than 10.
heavy_shipments = list(filter(lambda s: s[3] >10, shipments))
for h in heavy_shipments:
    print(h)

# 10. Use map() to extract all city names.
all_cities = list(map(lambda s: s[2], shipments))
print(all_cities)

# 11. Use map() + set() to get the unique cities.
unique_cities = set(map(lambda s: s[2], shipments))
print(unique_cities)

# 12. Sort the shipment list by cost from lowest to highest using key.
sorted_by_cost = sorted(shipments, key=lambda s: s[5])
for s in sorted_by_cost:
    print(s)

# 13. Sort by weight from highest to lowest.
sorted_by_weight = sorted(shipments, key=lambda s: s[3], reverse=True)
for s in sorted_by_weight:
    print(s)

# 14. Sort alphabetically by customer name.
sorted_by_customer = sorted(shipments, key=lambda s: s[1])
for s in sorted_by_customer:
    print(s)

# 15. Create a lambda function that calculates: (cost per kg = cost / weight) and display it for every shipment.
cost_per_kg = lambda x: x[5] / x[3]
for s in shipments:
    print(f"Shipment {s[0]} ({s[1]}): Cost/KG = {cost_per_kg(s):.2f}")