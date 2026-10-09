#Unstructured Data -- Text, Audio, Video, PDF, Doc -- Azure Cloud

#File Write
file = open("employees.txt", "w")

file.write("101,Aman,IT,75000\n")
file.write("102,Meera,HR,65000\n")
file.write("103,Rohan,Finance,70000\n")

file.close()

#File read
file = open("employees.txt", "r")

data = file.read()
print(data)

file.close()

file = open("employees.txt", "r")

for line in file:
    print(line.strip())

file.close()

file = open("employees.txt", "a")
file.write("104, Sara, Sales, 68000\n")
file.close()


# Semi Structured Data -- JSON -- Mongo DB

#write json file
import json

products = [
    {
        "product_id": 101,
        "product_name": "Laptop",
        "category": "Electronics",
        "price": 65000
    },
    {
        "product_id": 102,
        "product_name": "Mouse",
        "category": "Accessories",
        "price": 1500
    },
    {
        "product_id": 103,
        "product_name": "Monitor",
        "category": "Electronics",
        "price": 18000
    }
]

with open("products.json", "w") as file:
    json.dump(products, file, indent=4)

#read json file
with open("products. json", "r") as file:
    products = json.load(file)

print(products)

#Modify the json
with open("products. json", "r") as file:
    products = json.load(file)

    for product in products:

        if product["product_id"] == 101:
            product["price"] = 70000

with open("products.json", "w") as file:
    json.dump(products, file, indent=4)

# Structure Data -- Tables -- MY SQL

#write csv file
import csv

with open("products.csv", "w", newline="") as file:

    writer = csv.writer(file)

    writer.writerow([
        "product_id",
        "product_name",
        "category",
        "price"
    ])

    writer.writerow([101, "Laptop", "Electronics", 65000])
    writer.writerow([102, "Mouse", "Accessories", 1500])
    writer.writerow([103, "Office Chair", "Furniture", 9000])
    writer.writerow([104, "Monitor", "Electronics", 18000])

#Normal Reader - gives output as list
with open("products.csv", "r") as file:

    reader = csv.reader(file)

    for row in reader:
        print(row)

#DictReader - gives output as dictionary
with open("products.csv", "r") as file:

    reader = csv.DictReader(file)

    for row in reader:
        print(row)

#Module Calling
import calculator
#from calculator import add - specific import

print(calculator.add(10,20))
print(calculator.subtract(50,20))
print(calculator.multiply(5,4))