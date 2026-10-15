# 18. Create a Shipment class.
class Shipment:
    # 19. Add constructor values for shipment ID, destination, weight and cost.
    def __init__(self, shipment_id, destination, weight, cost):
        self.shipment_id = shipment_id
        self.destination = destination
        self.weight = weight
        self.cost = cost

    # 20. Add a display method.
    def display(self):
        print(f"{self.shipment_id} to {self.destination}: {self.weight} kg, ₹{self.cost}")

# 21. Create ExpressShipment inheriting from Shipment.
class ExpressShipment(Shipment):
    # 22. Override a method to add an express surcharge.
    def display(self):
        express_cost = self.cost * 1.20
        print(f"Express {self.shipment_id} to {self.destination}: ₹{express_cost:.2f}")

# 23. Demonstrate polymorphism using normal and express shipment objects.
shipment_objects = [Shipment("S2001", "Chennai", 12, 600),
                    ExpressShipment("S2002", "Coimbatore", 8, 500)]
for shipment in shipment_objects:
    shipment.display()  # Polymorphism