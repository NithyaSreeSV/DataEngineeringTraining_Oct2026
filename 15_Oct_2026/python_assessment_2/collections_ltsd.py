# 7. Create a list of shipment costs.
shipment_costs = [850, 620, 1250, 480, 1600, 740, 590, 1100, 920, 1750, 520, 1050]

# 8. Calculate total, average, minimum and maximum.
print("Total:", sum(shipment_costs), "Average:", sum(shipment_costs) / len(shipment_costs))
print("Minimum:", min(shipment_costs), "Maximum:", max(shipment_costs))

# 9. Remove duplicate destination cities using a set.
destinations = ["Hyderabad", "Mumbai", "Bangalore", "Delhi", "Pune", "Hyderabad", "Mumbai", "Delhi", "Bangalore", "Pune", "Hyderabad", "Mumbai"]
unique_cities = set(destinations)
print("Unique Destinations:", unique_cities)

# 10. Store one shipment using a dictionary.
single_shipment = {"shipment_id": "S1001", "destination": "Hyderabad", "weight": 12.5, "status": "Delivered", "cost": 850}

# 11. Store multiple shipments using a list of dictionaries.
shipments_db = [
    {"shipment_id": "S1001", "destination": "Hyderabad", "weight": 12.5, "status": "Delivered", "cost": 850},
    {"shipment_id": "S1002", "destination": "Mumbai", "weight": 8.0, "status": "In Transit", "cost": 620},
    {"shipment_id": "S1003", "destination": "Bangalore", "weight": 18.5, "status": "Delivered", "cost": 1250}
]

# 12. Filter list records by status.
delivered_records = [s for s in shipments_db if s["status"] == "Delivered"]
print("Delivered Records:", delivered_records)