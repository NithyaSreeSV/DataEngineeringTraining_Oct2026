import json

# 24. Read employees.json.
with open("employees.json", "r") as file:
    employees = json.loads(file)

# 25. Display all employee names.
# Way 1
print("Employee names: ")
for employee in employees:
    print(employee["name"])

# Way 2
print("Employee names:", [employee["name"] for employee in employees])

# 26. Find employees earning above 75000.
print("Salary above 75000:", [employee["name"] for employee in employees if employee["salary"] > 75000])

# 27. Display employees knowing Python.
print("Know Python:", [employee["name"] for employee in employees if "Python" in employee["skills"]])

# 28. Display employee name and performance rating.
for employee in employees:
    print("Name", employee["name"], "Rating:", employee["performance"]["rating"])

# 29. Find employees whose rating exceeds 4.5.
print("Rating above 4.5:", [e["name"] for e in employees if e["performance"]["rating"] > 4.5])

# 30. Sort employees by rating descending.
print("Sorted by rating:", [e["name"] for e in sorted(employees, key=lambda e: e["performance"]["rating"],
                                                      reverse=True)])

# 31. Add one skill to employee 303.
for employee in employees:
    if employee["employee_id"] == 303 and "Python" not in employee["skills"]:
        employee["skills"].append("Python")

# 32. Save the modified JSON.
with open("employees_updated.json", "w") as file:
    json.dump(employees, file, indent=4)