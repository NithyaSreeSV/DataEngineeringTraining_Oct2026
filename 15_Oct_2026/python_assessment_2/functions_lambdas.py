import pandas as pd

# 13. Create a function calculating shipping cost.
def shipping_cost(weight, cost):
    if weight <= 0:
        return 0
    return cost / weight

# 14. Create a function returning shipment category based on weight.
def shipment_category(weight):
    if weight > 20:
        return "Heavy"
    if weight >= 10:
        return "Medium"
    return "Light"

# 15. Use lambda/filter to select Delivered shipments.
def filter_delivered(shipments):
    return [shipment for shipment in shipments if shipment["status"] == "Delivered"]

    # Way 2
    # delivered = list(filter(lambda item: item["status"] == "Delivered", shipment_records))
    # print("Delivered shipments:", [item for item in delivered])

# 16. Use map to obtain all destinations.
shipments = pd.read_csv("shipments.csv")
shipment_records = shipments.to_dict(orient="records")
print("Destinations using map:", list(map(lambda item: item["destination"], shipment_records)))

# 17. Sort shipment dictionaries by cost.
print("Shipments sorted by cost:", [item for item in sorted(shipment_records, key=lambda item: item["cost"])])