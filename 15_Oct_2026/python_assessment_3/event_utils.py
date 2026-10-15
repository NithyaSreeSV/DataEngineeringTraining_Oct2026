# Create: event_utils.py
# 75. Add functions for: calculate booking amount, calculate discount, check event capacity
def calculate_booking(ticket_price, tickets):
    return ticket_price * tickets


def calculate_discount(amount):
    return amount * (0.10 if amount >= 10000 else 0.05)


def check_capacity(capacity, registered):
    if registered == capacity:
        return "Full"
    if registered < capacity:
        return "Seats Available"
    return "Invalid Data"

# Create: main.py
# 76. Import the entire module.
# 77. Call all three functions.
# 78. Import one function directly.
# 79. Import the module using an alias.

# Checkout main.py