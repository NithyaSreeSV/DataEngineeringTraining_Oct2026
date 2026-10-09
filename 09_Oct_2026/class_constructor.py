#Constructor
class Product:
    def __init__(self):
        print("Product object created")

p1 = Product()

#Parameterized Constructor
class Employee:
    def __init__(self, emp_id, name, department, salary):
        self.emp_id = emp_id
        self.name = name
        self.department = department
        self.salary = salary

e1 = Employee(101, "Aman", "IT", 75000)
e2 = Employee(102, "Sara", "HR", 65000)

#Accessing Super class constructor
class Employee3:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

class Developer3(Employee3):
    def __init__(self, name, salary, language):
        super().__init__(name, salary)
        self.language = language

d1 = Developer3("Neha",85000,"Python")

print(d1.name)
print(d1.salary)
print(d1.language)
