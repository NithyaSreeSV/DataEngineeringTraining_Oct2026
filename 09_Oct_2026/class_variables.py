class Employee:
    name = "Nithya" #Public - Accessible anywhere
    _department = "IT" #Protected - Accessible within class and subclasses
    __bonus = 60000 #Private - Accessible only within the class

e1 = Employee()
print(e1.name)
print(e1._department)
print(e1.__bonus)