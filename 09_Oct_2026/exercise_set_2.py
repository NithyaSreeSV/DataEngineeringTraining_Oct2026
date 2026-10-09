# Data setup
sales = [
("North", 12000),
("South", 18000),
("West", 9500),
("North", 22000),
("East", 15000),
("South", 11000)]

# 1. Display all tuples.
print(sales)

# 2. Display only the region from every tuple.
for region, amount in sales:
    print(region)

# 3. Display only the sales amount.
for region, amount in sales:
    print(amount)

# 4. Find sales greater than 12000.
high_sale_region = [s for s in sales if s[1] > 12000]
print("Regions with high sales:")
for region,amount in high_sale_region:
    print(region, amount)

# 5. Calculate total sales.
total_sale = sum(amount for region,amount in sales)
print(f"Total sales: {total_sale}")

# 6. Find the highest and lowest sales amount.
amounts = [amount for region,amount in sales]
highest_sale, lowest_sale = max(amounts), min(amounts)
print(f"Highest sale amount: {highest_sale} and lowest sale amount: {lowest_sale}")

# 7. Create a list containing only sales amounts.
sales_amounts_only = [amount for region, amount in sales]
print(sales_amounts_only)

# 8. Find unique regions using a set.
unique_regions = set(region for region, amount in sales)
print(unique_regions)

# 9. Sort the tuples based on sales amount.
sorted_by_amount = sorted(sales, key=lambda x: x[1])
print(sorted_by_amount)

# 10. Sort the tuples based on region name.
sorted_by_region = sorted(sales, key=lambda x: x[0])
print(sorted_by_region)