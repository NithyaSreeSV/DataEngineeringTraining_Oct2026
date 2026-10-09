# String input from user
name = input("Enter your name: ")

print("Hello", name)

# int input from user
age = int(input("Enter your age: "))

next_age = age + 1
print(next_age)

# mixed input from user
product = input("Enter product name: ")
price = float(input("Enter price: "))
quantity = int(input("Enter quantity: "))

total = price * quantity

print(f"Product: {product}")
print(f"Total Amount: {total}")

# use of f-strings
print("My name is", name, "and I am", age, "years old")

print(f"My name is {name} and I am {age} years old")