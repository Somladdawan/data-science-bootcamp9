# OOP: Object Oriented Programming

class DataAnalyst:
   def __init__ (self, name, age, graduatated, salary, method_01, method_02):
      self.name = name
      self.age = age
      self.graduatated = graduatated
      self.salary = salary
      self.method_01 = method_01
      self.method_02 = method_02

   def personal (self):
      print(f"My name is {self.name} , I'am {self.age} years old and i was graduated from {self.graduatated}")
   def ex_salary (self):
      result = self.salary*1.20
      print(f"My current annual salary is {self.salary} THB, and I am seeking a salary of {int(result)} THB")
   def skill (self):
      print(f"I am proficient in using {self.method_01} and {self.method_02} for data analysis and manipulation")

per01 = DataAnalyst("Kanittha", 30, "Bussiness", 30000, "R", "Python")
per02 = DataAnalyst("Phatcharaporn", 24, "Economic", 32000, "Python", "SQL")
per03 = DataAnalyst("kannika", 27, "Bussiness", 35000, "spreadsheet", "Excel")

per02.personal()
per02.ex_salary()
per02.skill()
