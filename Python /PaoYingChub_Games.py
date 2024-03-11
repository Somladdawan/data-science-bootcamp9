import random
def games():
  options = ["hammer", "scissors", "paper"]
  user_name = input("Hi! New partner. What is your name ?")
  print(f"It's great to meet you {user_name}!!")
  result = 0
  while True:
    computer_test = random.choice(options)
    user = input(f"Player: ")
    if user == "stop":
       break
    if (user == "paper" and computer_test == "hammer") or\
       (user == "hammer" and computer_test == "scissors") or\
       (user == "scissors" and computer_test == "paper"):
       result_n = 1    
       result = result + 1
    elif (user == "paper" and computer_test == "scissors")or\
         (user == "hammer" and computer_test == "paper") or\
         (user == "scissors" and computer_test == "hammer"):     
         result_n = -1
         result = result - 1
    elif (user == "paper" and computer_test == "paper")or\
         (user == "hammer" and computer_test == "hammer") or\
         (user == "scissors" and computer_test == "scissor"):     
         result_n = 0
         result = result + 0

    else:
         result = print("Your score: Inncorect Option Please try again!!")
    
    print(f"Computer: {computer_test}") 
    print(f"Your score: {result_n}")
    print(f"Total {result}")

games()
