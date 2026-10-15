import csv
import json

#Text file

# 40. Create activity.txt.
# 41. Write three processing messages to it.
with open("activity.txt", "w") as file:
    file.write("Order file loaded.\nCustomer records checked.\nOrder totals calculated.\n")

# 42. Append one additional message.
with open("activity.txt", "a") as file:
    file.write("Activity log completed.")

# 43. Read and display the complete file.
with open("activity.txt", "r") as file:
    print(file.read())

# CSV file

# Using customers.csv:
# 44. Read the CSV using the csv module.
with open("customers.csv", "r") as file:
    reader = csv.reader(file)


# 45. Store the records in a Python list.
with open("customers.csv", "r") as file:
    customers = list(csv.DictReader(file))
    for customer_row in customers:
        customer_row["active"] = customer_row["active"].lower() == "true"

# 46. Display only active customers.
print("Active customers:", [c["customer_name"] for c in customers if c["active"]])

# 47. Display only Hyderabad customers.
print("Hyderabad customers:", [c["customer_name"] for c in customers if c["city"] == "Hyderabad"])

# JSON file

# Using products.json:
# 48. Read the JSON file.
with open("products.json", "r") as file:
    products = json.load(file)

# 49. Display all product names.
for product in products:
    print(product["product_name"])

# 50. Display products costing above 10000.
for product in products:
    if(product["price"] > 10000):
        print(product["product_name"])

# 51. Display supplier name and supplier city for every product.
for product in products:
    print(product["product_name"], "supplier:", product["supplier"]["name"], "-", product["supplier"]["city"])

# 52. Extract all colors into one list.
colors = [color for product in products for color in product["colors"]]
print("All colors:", colors)

# 53. Display unique colors.
print("Unique colors:", set(colors))

# 54. Increase stock of product ID 202.
for product in products:
    if product["product_id"] == 202:
        product["stock"] += 5

# 55. Write the modified data back to a new file: products_updated.json.
with open("products_updated.json", "w") as file:
    json.dump(products, file, indent=4)