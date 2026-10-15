# 30. Create a class Product with: product_id, product_name, price, stock and Initialize the values using __init__().
class Product:
    def __init__(self, product_id, product_name, price, stock):
        self.product_id = product_id
        self.product_name = product_name
        self.price = price
        self.stock = stock

    # 31. Add a method display_product().
    def display_product(self):
        print(f"{self.product_name}: price ₹{self.price}, stock {self.stock}")

    # 32. Add a method calculate_value() returning: price × stock.
    def calculate_value(self):
        return self.price * self.stock

# 33. Create two product objects.
product_1 = Product(201, "Headphones", 15000, 10)
product_2 = Product(202, "Mouse", 5000, 10)

# 34. Create a child class: DiscountedProduct and Inherit from Product.
class DiscountedProduct(Product):
    def __init__(self, product_id, product_name, price, stock, discount_percent):
        # 35. Add discount_percent.
        self.discount_percent = discount_percent
        # 36. Use super() to initialize parent values.
        super().__init__(product_id, product_name, price, stock)


    # 37. Override display_product() so the discounted product also displays its discount.
    def display_product(self):
        print(f"{self.product_name}: ₹{self.price}, discount {self.discount_percent}%")

# 38. Create another class: PremiumProduct and Give it its own version of display_product().
class PremiumProduct(Product):
    def display_product(self):
        print(f"Premium product: {self.product_name}, ₹{self.price}")

# 39. Put Product , DiscountedProduct and PremiumProduct objects into a list and call display_product() for each to demonstrate polymorphism.
product_objects = [Product(203, "Laptop", 65000, 12),
                   DiscountedProduct(204, "Monitor", 18000, 8, 10),
                   PremiumProduct(205, "Office Chair", 9000, 15)]

for item in product_objects:
    item.display_product()