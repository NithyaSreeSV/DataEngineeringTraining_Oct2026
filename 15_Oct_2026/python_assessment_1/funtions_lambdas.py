# 21. Create a function calculate_total(price, quantity).
def calculate_total(price, quantity):
    return price * quantity

# 22. Create a function calculate_discount(amount) that returns the discount.
def calculate_discount(amount):
    rate = 0.10 if amount >= 50000 else 0.05
    return amount * rate

# 23. Create a function accepting a list of sales and returning total sales.
def total_sales(sales):
    return sum(sales)

# 24. Create a function accepting a product dictionary and returning "Available" or "Out of Stock".
def product_availability(prod):
    return "Available" if prod["stock"] > 0 else "Out of Stock"

# 25. Use a lambda function to calculate the square of a number.
print("Square using lambda:", (lambda number: number ** 2)(10))

# 26. Use filter() with lambda to select sales greater than 20000.
sales = [65000, 4500, 36000, 12000, 18000, 72000, 9000]
print("Sales above 20000 using filter:", list(filter(lambda value: value > 20000, sales)))

# 27. Use map() to extract customer cities from a list of dictionaries.
customer_records = [{"name": "A", "city": "Hyderabad"}, {"name": "B", "city": "Mumbai"}, {"name": "C", "city": "Hyderabad"}]
customer_cities = list(map(lambda record: record["city"], customer_records))

# 28. Use set() to get unique cities.
print("Cities:", customer_cities, "Unique:", set(customer_cities))

# 29. Sort a list of product dictionaries by price using key=.
products = [{
    "product_id": 201,
    "product_name": "Laptop",
    "category": "Electronics",
    "price": 65000,
    "stock": 12,
    "supplier": {
    "name": "Tech Source",
    "city": "Hyderabad"}
  },{
    "product_id": 202,
    "product_name": "Monitor",
    "category": "Electronics",
    "price": 18000,
    "stock": 8,
    "supplier": {
    "name": "Vision Traders",
    "city": "Mumbai"}
  },{
    "product_id": 203,
    "product_name": "Office Chair",
    "category": "Furniture",
    "price": 9000,
    "stock": 15,
    "supplier": {
    "name": "Comfort Works",
    "city": "Pune"} }]
print("Products sorted by price:", [p["product_name"] for p in sorted(products, key=lambda p: p["price"])])

# Example Run
price, quantity = 10000, 5
amount = calculate_total(price, quantity)
print("Amount: ", amount)

discount = calculate_discount(amount)
print("Discount: ", discount)

total_sales = total_sales(sales)
print("Total sales: ", total_sales)

product = products[0]
product_availability = product_availability(product)
print("Product availability: ", product_availability)