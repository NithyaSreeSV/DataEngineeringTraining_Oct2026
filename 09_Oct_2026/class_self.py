class Product:
    name = ""
    price = 0
    quantity = 0

    def total_amount(self): #self - refers to the specific/current instance of the class
        return self.price * self.quantity

p1 = Product()

p1.name = "Laptop"
p1.price = 65000
p1.quantity = 2

print(p1.total_amount())