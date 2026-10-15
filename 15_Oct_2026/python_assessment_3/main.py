# Create: main.py

# 76. Import the entire module.
# 77. Call all three functions.
# 78. Import one function directly.
# 79. Import the module using an alias.

import event_utils
from event_utils import calculate_booking
import event_utils as eu
amount = event_utils.calculate_booking(2500, 4)
print("Booking amount:", amount)
print("Discount:", event_utils.calculate_discount(amount))
print("Capacity:", eu.check_capacity(100, 80))
print("Direct import:", calculate_booking(1500, 2))