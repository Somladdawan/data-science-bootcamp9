import random  #modo
class ATM:
    def __init__(self, name_account, bank_name, initial): #dunder
       self.name_account = name_account
       self.bank_name = bank_name
       self.balance = initial

      # string representation
    def __str__(self):
       return(f"This is an account of {self.name_account}, bank: {self.bank_name}")

      # method => function
    def check_balance(self):
       print(f"Balance: {self.balance} THB")

    def deposit(self, money):
       self.balance += money
       print(f"Deposit Successfully: your new balance is {self.balance} THB")

    def withdraw (self, money):
       self.balance -= money
       print(f"Withdraw Successfully: your new balance is {self.balance} THB")

    def random_otp(self):
      otp = random.randint(0,9999)
      print(f"Your OTP: {otp}") 