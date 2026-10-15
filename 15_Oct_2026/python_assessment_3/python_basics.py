# 1. Take attendee name, number of tickets and ticket price from the user.
attendee_name = input("Enter attendee name: ").strip()
tickets = int(input("Enter number of tickets: "))
ticket_price = float(input("Enter ticket price: "))

# 2. Calculate total booking amount.
amount = ticket_price * tickets

# 3. Apply: 10% discount when amount is ₹10,000 or more 5% otherwise.
discount = amount * (0.10 if amount >= 10000 else 0.05)

# 4. Display all results using f-strings.
print(f"Attendee: {attendee_name}")
print(f"Booking amount: Rs.{amount:,.2f}")
print(f"Discount: Rs.{discount:,.2f}")
print(f"Final amount: Rs.{amount - discount:,.2f}")

# 5. Ask the user for event capacity and registered participants.
capacity = int(input("Enter event capacity: "))
registered = int(input("Enter registered participants: "))

# 6. Display: Full if registrations equal capacity Seats Available if below capacity Invalid Data if registrations exceed capacity.
if registered == capacity:
    capacity_status = "Full"
if registered < capacity:
    capacity_status = "Seats Available"
else:
    capacity_status = "Invalid Data"

print("Capacity status:", capacity_status)

# 7. Print numbers 1–15 using a for loop.
for number in range(1, 16):
    print(number, end=" ")

# 8. Display only numbers divisible by 3.
print("\nDivisible by 3:", [number for number in range(1, 16) if number % 3 == 0])

# 9. Use a while loop to count down from 10 to 1.
countdown = 10
while countdown >= 1:
    print(countdown, end=" ")
    countdown -= 1

print()

# 10. Use break and continue in suitable examples.
for number in range(1, 11):
    if number == 3:
        continue  # Skip 3 as an example of continue.
    if number == 8:
        break  # Stop the loop at 8.
    print(number, end=" ")

print()