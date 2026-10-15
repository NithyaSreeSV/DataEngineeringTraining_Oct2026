# 33. Create: shipment_utils.py containing reusable shipment functions.
def shipping_cost(weight, cost):
    """Return cost per kilogram; protect against zero weight."""
    if weight <= 0:
        return 0
    return cost / weight


def shipment_category(weight):
    if weight > 20:
        return "Heavy"
    if weight >= 10:
        return "Medium"
    return "Light"


def filter_delivered(shipments):
    return [shipment for shipment in shipments if shipment["status"] == "Delivered"]

# 34. Import them into main.py.
# 35. Use both normal import and specific-function import.
# Checkout main.py