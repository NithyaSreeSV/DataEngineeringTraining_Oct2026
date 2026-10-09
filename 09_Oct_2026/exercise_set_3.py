import json

# Data setup
projects_data = [
{
"project_id": 101,
"project_name": "Data Migration",
"department": "IT",
"budget": 450000,
"technologies": ["Python", "SQL", "Azure"],
"team": [
{
"name": "Vikram",
"role": "Engineer",
"experience": 4
},
{
"name": "Meera",
"role": "Analyst",
"experience": 3
}
]
},
{
"project_id": 102,
"project_name": "Customer Analytics",
"department": "Analytics",
"budget": 300000,
"technologies": ["Python", "Pandas", "Power BI"],
"team": [
{
"name": "Karan",
"role": "Data Analyst",
"experience": 5
},
{
"name": "Zoya",
"role": "Developer",
"experience": 2
}
]
},
{
"project_id": 103,
"project_name": "Cloud Modernization",
"department": "Cloud",
"budget": 600000,
"technologies": ["Azure", "Docker", "Python"],
"team": [
{
"name": "Naveen",
"role": "Cloud Engineer",
"experience": 6
},
{
"name": "Isha",
"role": "Engineer",
"experience": 4
}
]
}
]
with open("projects.json", "w") as file:
    json.dump(projects_data, file, indent=4)

# 1. Read the JSON file into Python.
with open("projects.json", "r") as file:
    projects = json.load(file)

print(projects)

# 2. Check the datatype of the returned object.
print(f"Datatype of the object: {type(projects)}")

# 3. Display all project names.
for project in projects:
    print(project)

# 4. Display projects having a budget above ₹4,00,000.
for p in projects:
    if p["budget"] > 400000:
        print(f"{p['project_name']} - Budget: ₹{p['budget']:,}")

# 5. Display projects that use Python.
for p in projects:
    if "Python" in p["technologies"]:
        print(f"{p['project_name']}")

# 6. Calculate the total budget of all projects.
# way 1
total_budget = 0
for p in projects:
    total_budget += p["budget"]

# way 2
total_cost = sum([p["budget"] for p in projects])
print(f"Total budget: {total_budget}")

# 7. Extract all technologies into one Python list.
all_tech = []
for p in projects:
    all_tech.extend(p["technologies"])
print(all_tech)

# 8. Find the unique technologies.
unique_tech = list(set(all_tech))
print(unique_tech)

# 9. Display every team member's: name, role, experience.
for p in projects:
    for member in p["team"]:
        print(f"Name: {member['name']}, Role: {member['role']}, Experience: {member['experience']} years")

# 10. Display team members having more than 3 years of experience.
for p in projects:
    for member in p["team"]:
        if(member["experience"]>3):
            print(f"Name: {member['name']}, Role: {member['role']}, Experience: {member['experience']} years")

# 11. Find the total number of team members across all projects.
total_members = sum(len(p["team"]) for p in projects)
print(f"Total number of team members: {total_members}")

# 12. Sort projects by budget from highest to lowest.
sorted_by_budget = sorted(projects, key=lambda b: b["budget"], reverse=True)
for p in sorted_by_budget:
    print(f"{p['project_name']}: ₹{p['budget']:,}")

# 13. Sort projects alphabetically by project name.
sorted_by_name = sorted(projects, key=lambda p: p["project_name"])
for p in sorted_by_name:
    print(f"{p['project_name']}")

# 14. Sort each project's team members based on experience.
print("Each Project's Team Sorted by Experience:")
for p in projects:
    print(f"Project: {p['project_name']}")
    # Sorts the underlying list of dictionaries in-place
    p["team"].sort(key=lambda x: x["experience"])
    for member in p["team"]:
        print(f"  * {member['name']} ({member['experience']} yrs)")