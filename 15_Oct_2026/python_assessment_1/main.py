# Create: main.py

# 57. Import the module.
# 59. Import one function directly and call it without the module name.
# 60. Import the module using an alias.
import retail_utils
from retail_utils import calculate_total
import retail_utils as ru

# 58. Call all three functions.
price = 12000
quantity = 2
product = {
    "product_id": 201,
    "product_name": "Laptop",
    "category": "Electronics",
    "price": 65000,
    "stock": 12,
    "supplier": {
    "name": "Tech Source",
    "city": "Hyderabad"}
}
amount = retail_utils.calculate_total(price, quantity)
print("Order total:", amount)
print("Discount:", retail_utils.calculate_discount(amount))
print("Stock status:", retail_utils.product_availability(product))
print("Direct function import:", calculate_total(500, 3))
print("Aliased module call:", ru.product_availability(product))