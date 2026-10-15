# List
sales = [65000, 4500, 36000, 12000, 18000, 72000, 9000]

# 10. Find total sales.
print("Total sales:", sum(sales))

# 11. Find highest and lowest sale.
print("Highest sale:", max(sales), "Lowest sale:", min(sales))

# 12. Display sales greater than 20000.
print("Sales above 20000:", [sale for sale in sales if sale > 20000])

# 13. Sort sales from highest to lowest.
print("Descending sales:", sorted(sales, reverse=True))

# Set
cities = ["Hyderabad", "Mumbai", "Delhi", "Hyderabad", "Pune", "Mumbai"]

# 14. Create a set from the list and display unique cities.
print("Unique cities:", set(cities))

# Tuple

# 15. Create a tuple containing: Product ID, Product Name, Category, Price and unpack it into individual variables.
product_tuple = (201, "Laptop", "Electronics", 65000)
product_id, product_name, category, price = product_tuple
print("Unpacked tuple:", product_id, product_name, category, price)

# Dictionary

# 16. Create a dictionary representing a customer with: ID, Name, City, Orders, Active status
customer = {"id": "C101", "name": "Nithya", "city": "Hyderabad", "orders": 3, "active": True}

# 17. Update the customer's city.
customer["city"] = "Chennai"

# 18. Increase order count by 1.
customer["orders"] += 1

# 19. Add an email field.
customer["email"] = "nithya@example.com"

# 20. Loop through all keys and values.
for key, value in customer.items():
    print(f"{key}: {value}")