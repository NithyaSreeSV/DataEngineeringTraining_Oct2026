# 1. Take product name, unit price and quantity from the user.
product_name = input("Enter product name: ").strip()
unit_price = float(input("Enter unit price: "))
quantity = int(input("Enter quantity: "))

# 2. Calculate total amount.
original_amount = unit_price * quantity

# 3. If total amount is greater than or equal to 50000 , apply 10% discount; otherwise apply 5%.
rate = 0.10 if original_amount >= 50000 else 0.05
discount = original_amount * rate

# 4. Display original amount, discount and final amount using f-strings.

print(f"Product: {product_name}")
print(f"Original amount: ₹{original_amount:,.2f}")
print(f"Discount: ₹{discount:,.2f}")
print(f"Final amount: ₹{original_amount - discount:,.2f}")

# 5. Ask for stock quantity and display: High Stock for stock above 20, Low Stock for stock between 1 and 20, Out of Stock for 0
stock = int(input("Enter available stock quantity: "))
if stock > 20:
    print("High Stock")
elif stock >= 1:
    print("Low Stock")
else:
    print("Out of Stock")

# 6. Use a for loop to display numbers 1 through 10.
for number in range(1, 11):
    print(number, end=" ")
print()

# 7. Use a while loop to reduce stock from 5 to 0.
remaining_stock = 5
while remaining_stock >= 0:
    print("Stock:", remaining_stock)
    remaining_stock -= 1

# 8. Skip number 5 using continue.
# 9. Stop a loop when the value reaches 8 using break.
for number in range(1, 11):
    if number == 5:
        continue
    if number == 8:
        break
    print(number, end=" ")