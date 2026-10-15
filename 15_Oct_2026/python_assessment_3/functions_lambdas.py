booking_amounts = [ 5000, 3500, 7500, 6000, 4000, 7000, 3000, 10000 ] # Example array

# 26. Create a function: calculate_booking(ticket_price, tickets)
def calculate_booking(ticket_price, tickets):
    return ticket_price * tickets

# 27. Create a function that accepts booking amount and returns the discount amount.
def calculate_discount(amount):
    return amount * (0.10 if amount >= 10000 else 0.05)

# 28. Create a function that accepts registration status and returns whether the registration is active.
def active_registration(status):
    return status == "Confirmed"

# 29. Create a function accepting a list of booking amounts and returning the total.
def total_bookings(amounts):
    return sum(amounts)

# 30. Write a lambda function that increases an amount by 10%.
increase_by_ten_percent = lambda value: value * 1.10
print("Amount increased by 10%:", increase_by_ten_percent(5000))

# 31. Use filter() and lambda to select amounts greater than 6000.
print("Amounts above 6000:", list(filter(lambda value: value > 6000, booking_amounts)))

# 32. Create a list of registration dictionaries and use filter() to return Confirmed registrations.
registrations = [{"attendee_name": "Aarav", "city": "Hyderabad", "status": "Confirmed", "amount": 5000},
                 {"attendee_name": "Faiz", "city": "Pune", "status": "Pending", "amount": 7500},
                 {"attendee_name": "Simran", "city": "Mumbai", "status": "Confirmed", "amount": 3500}]
print("Confirmed:", list(filter(lambda row: row["status"] == "Confirmed", registrations)))

# 33. Use map() to extract attendee cities.
print("Cities:", list(map(lambda row: row["city"], registrations)))

# 34. Use map() and set() to obtain unique cities.
print("Unique mapped cities:", set(map(lambda row: row["city"], registrations)))

# 35. Sort a list of registration dictionaries using: key= based on amount.
print("Sorted by amount:", sorted(registrations, key=lambda row: row["amount"]))

# Example Run
print("Booking amount:", calculate_booking(2500, 3))
print("Discount amount:", calculate_discount(12000))
print("Is active:", active_registration("Confirmed"))
print("Total bookings:", total_bookings(booking_amounts))