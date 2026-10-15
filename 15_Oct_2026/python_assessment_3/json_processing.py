import json

# Using: staff.json:

# 61. Read JSON into Python.
with open("staff.json", "r") as file:
    staff_data = json.load(file)

# 62. Check the datatype of the returned object.
print(f"Datatype of loaded JSON object: {type(staff_data)}")

# 63. Display all staff names.
for emp in staff_data:
    print(emp["name"])

# 64. Display employees from Operations.
for emp in staff_data:
    if emp["department"] == "Operations":
        print(emp["name"])

# 65. Display employees whose salary exceeds ₹75,000.
for emp in staff_data:
    if emp["salary"] > 75000:
        print(f"{emp["name"]}: Rs. {emp["salary"]}")

# 66. Find employees having Python in their skills.
for emp in staff_data:
    if "Python" in emp["skills"]:
        print(emp["name"])

# 67. Display: Name, Rating, Events Handled.
for emp in staff_data:
    print(f"Name: {emp["name"]} | Rating: {emp["performance"]["rating"]} | Events Handled: {emp["performance"]["events_handled"]}")

# 68. Find staff whose performance rating exceeds 4.5.
print("Rating above 4.5:", [e["name"] for e in staff_data if e["performance"]["rating"] > 4.5])

# 69. Extract all skills into one list.
skills = [skill for emp in staff_data for skill in emp["skills"]]
print("All skills:", skills)

# 70. Find unique skills.
print("Unique skills:", set(skills))

# 71. Sort employees by salary descending.
print("Sorted by salary:", [e["name"] for e in sorted(staff_data, key=lambda e: e["salary"],
                                                      reverse=True)])

# 72. Sort employees by performance rating descending.
print("Sorted by rating:", [e["name"] for e in sorted(staff_data, key=lambda e: e["performance"]["rating"],
                                                      reverse=True)])

# 73. Add "Pandas" to staff ID 503.
for emp in staff_data:
    if emp["staff_id"] == 503 and "Excel" not in emp["skills"]:
        emp["skills"].append("Excel")

# 74. Save the modified JSON as: staff_updated.json.
with open("staff_updated.json", "w") as file:
    json.dump(staff_data, file, indent=4)