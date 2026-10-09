#Inheritence_Ex1
class Employee1:

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    def display_employee(self):
        print(f"Name: {self.name}")
        print(f"Salary: {self.salary}")

class Developer1(Employee1):
    pass

developer = Developer1("Abdullah Khan",200000)
developer.display_employee()

#Inheritence_Ex2
class Employee2:

    def __init__ (self, name, salary):
        self.name = name
        self.salary = salary

    def display_employee(self):
        print(f"Name: {self.name}")
        print(f"Salary: {self.salary}")

class Developer2(Employee2):
    def write_code(self):
        print("Developer is writing code")

d1 = Developer2("Sara", 80000)
d1.display_employee()
d1.write_code()

#Polymorphism_Ex1
class Developer:
    def work(self):
        print("Developer writes code")

class Tester:
    def work(self):
        print("Tester tests the application")

d1 = Developer()
t1 = Tester()

d1.work()
t1.work()

#Polymorphism_Ex2
class Employee:
    def work(self):
        print("Employee works")

class Developer:
    def work(self):
        print("Developer writes code")

class Tester:
    def work(self):
        print("Tester tests the application")

def perform_work(employee):
    employee.work()

d1 = Developer()
t1 = Tester()

perform_work(d1)
perform_work(t1)

#Method overriding (Run-time polymorphism)
class Employee:
    def work(self):
        print("Employee works")

class Developer(Employee):
    def work(self):
        print("Developer writes code")

e1 = Employee()
d1 = Developer()

e1.work()
d1.work()