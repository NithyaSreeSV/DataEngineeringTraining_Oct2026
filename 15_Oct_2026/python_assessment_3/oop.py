# Create: Event with: event_id, event_name, capacity, ticket_price
class Event:
    # 36. Use __init__() to initialize attributes.
    def __init__(self, event_id, event_name, capacity, ticket_price):
        self.event_id = event_id
        self.event_name = event_name
        self.capacity = capacity
        self.ticket_price = ticket_price

    # 37. Create: display_event()
    def display_event(self):
        print(f"{self.event_name} ({self.event_id}) — capacity {self.capacity}, ticket ₹{self.ticket_price}")

    # 38. Create: calculate_revenue(tickets_sold)
    def calculate_revenue(self, tickets_sold):
        return self.ticket_price * tickets_sold

# Create: OnlineEvent that inherits from Event.
class OnlineEvent(Event):
    def __init__(self, event_id, event_name, capacity, ticket_price, platform):
        self.platform = platform # 40. Add: platform
        super().__init__(event_id, event_name, capacity, ticket_price) # 41. Use super().

    # 42. Override display_event() to also display the platform.
    def display_event(self):
        print(f"Online event: {self.event_name}, platform: {self.platform}, capacity: {self.capacity}")

# Create: PhysicalEvent
class PhysicalEvent(Event):
    def __init__(self, event_id, event_name, capacity, ticket_price, venue):
        super().__init__(event_id, event_name, capacity, ticket_price)
        self.venue = venue # 43. Add: venue

    # 44. Override display_event().
    def display_event(self):
        print(f"Physical event: {self.event_name}, venue: {self.venue}, capacity: {self.capacity}")

# 39. Create two Event objects.
event_one = Event("E101", "AI Innovation Summit", 500, 2500)
event_two = Event("E102", "Leadership Forum", 350, 1800)
print("Revenue:", event_one.calculate_revenue(20))

# 45. Put OnlineEvent and PhysicalEvent objects into a list.
event_objects = [OnlineEvent("E201", "Python Webinar", 1000, 500, "Zoom"),
                 PhysicalEvent("E202", "Data Bootcamp", 200, 1500, "City Hall")]

# 46. Call display_event() for every object to demonstrate polymorphism.
for event in event_objects:
    event.display_event()










