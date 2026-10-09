cities = {"Hyderabad", "Mumbai", "Delhi", "Hyderabad"}

print(cities)

cities.add("Pune")

cities.remove("Mumbai")

#Safer Option to Remove
cities.discard("Chennai")

cities = [
"Hyderabad",
"Mumbai",
"Delhi",
"Hyderabad",
"Mumbai" ]

unique_cities = set(cities)
print(unique_cities)