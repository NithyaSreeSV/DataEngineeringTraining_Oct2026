# Use: booking_amounts = [ 5000, 3500, 7500, 6000, 4000, 7000, 3000, 10000 ]
booking_amounts = [ 5000, 3500, 7500, 6000, 4000, 7000, 3000, 10000 ]

# 11. Find total booking amount.
# 12. Find average booking amount.
# 13. Find highest and lowest amounts.
print("Total:", sum(booking_amounts), "Average:", sum(booking_amounts) / len(booking_amounts))
print("Highest:", max(booking_amounts), "Lowest:", min(booking_amounts))

# 14. Display values greater than 5000.
print("Amounts above 5000:", [amount for amount in booking_amounts if amount > 5000])

# 15. Sort amounts descending.
print("Descending:", sorted(booking_amounts, reverse=True))

# Use: cities = [ "Hyderabad", "Mumbai", "Pune", "Hyderabad", "Delhi", "Mumbai" ]
cities = ["Hyderabad", "Mumbai", "Pune", "Hyderabad", "Delhi", "Mumbai"]

# 16. Find unique cities using a set.
# 17. Add another city to the set.
unique_cities = set(cities)
unique_cities.add("Chennai")

# 18. Find the number of unique cities.
print("Count of Unique Cities:", len(unique_cities))

# 19. Create a tuple containing: Event ID, Event Name, Venue, Capacity.
event_tuple = ("E101", "AI Innovation Summit", "Hyderabad Convention Centre", 500)

# 20. Unpack the tuple into separate variables.
event_id, event_name, venue, event_capacity = event_tuple
print("Event details:", event_id,"-", event_name,"-", venue,"-", event_capacity)

# 21. Create a dictionary representing one registration.
# Include: registration_id, attendee_name, city, tickets, status, amount
registration = {"registration_id": "R1001", "attendee_name": "Aarav Shah", "city": "Hyderabad",
                "tickets": 2, "status": "Pending", "amount": 5000}

# 22. Change its status.
registration["status"] = "Confirmed"

# 23. Increase ticket count.
registration["tickets"] += 1

# 24. Add an email field.
registration["email"] = "aarav@example.com"

# 25. Loop through all dictionary items.
for key, value in registration.items():
    print(f"{key}: {value}")