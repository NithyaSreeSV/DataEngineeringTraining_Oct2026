products = ["Laptop", "Mouse", "Keyboard", "Monitor"]

#Print list
print(products)

#Print based on index
print(products[0])
print(products[1])
print(products[2])
print(products[-1])

#Replace element
products[1] = "Wireless Mouse"
print(products)

#Append element(adds at the end)
products.append("Disk")
print(products)

#Insert at specific position
products.insert(1, "Led Monitor")
print(products)

#Remove an element
products.remove("Led Monitor")
print(products)

#Remove the last element
products.pop()
print(products)