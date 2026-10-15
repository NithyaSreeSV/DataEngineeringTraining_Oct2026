# Create: retail_utils.py

# 56. Add functions for: calculating order total, calculating discount, checking stock.

def calculate_total(price, quantity):
    return price * quantity

def calculate_discount(amount):
    rate = 0.10 if amount >= 50000 else 0.05
    return amount * rate

def product_availability(prod):
    return "Available" if prod["stock"] > 0 else "Out of Stock"

# Create: main.py

# 57. Import the module.
# 58. Call all three functions.
# 59. Import one function directly and call it without the module name.
# 60. Import the module using an alias.

# Checkout main.py