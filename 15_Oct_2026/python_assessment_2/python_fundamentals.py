# 1. Accept shipment weight and cost from the user.
weight = float(input("Enter shipment weight in kg: "))
cost = float(input("Enter shipping cost: "))

# 2. Calculate cost per kg.
cost_per_kg = 0 if weight <= 0 else cost / weight
print(f"Cost per kg: ₹{cost_per_kg:.2f}")

# 3. Classify: weight above 20 → Heavy, 10–20 → Medium, below 10 → Light
if weight > 20:
    category = "Heavy"
elif weight >= 10:
    category = "Medium"
else:
    category = "Light"
print("Shipment category:", category)

# 4. Use loops to display shipment numbers from 1–20.
for number in range(1, 21):
    print(number, end=" ")

# 5. Display only even shipment numbers.
print("\nEven shipment numbers:", [number for number in range(1, 21) if number % 2 == 0])

# 6. Use a while loop to simulate five processing attempts.
attempt = 1
while attempt <= 5:
    print(f"Processing attempt {attempt}")
    attempt += 1