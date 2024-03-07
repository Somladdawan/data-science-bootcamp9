game_condition <- c("rock", "paper", "scissors")

game <-function(){
  print ("Hi")
  print ("Hello to the games")
  print(readline("what is your name: "))
  score = 0  

  while(user != "finished"){
    user = readline("User turn: ")
    computer = (sample(game_condition, 1))
    
    if (user == "rock" & computer == "rock"){
      print(computer)
      score = score+0
      cat("your score ", score, "\n")
      
    } else if (user == "rock" & computer == "scissors") {
      print(computer)
      score = score+1
      cat("your score ",  score, "\n")
      
    } else if (user == "rock" & computer == "paper") {
      print(computer)
      score = score-1
      cat("your score ",  score, "\n")
      
    } else if (user == "paper" & computer == "rock") {
      print(computer)
      score = score+1
      cat("your score ",  score, "\n")
      
    } else if (user == "paper" & computer == "scissors") {
      print(computer)
      score = score-1
      cat("your score ",  score, "\n")
      
    } else if (user == "paper" & computer == "paper") {
      print(computer)
      score = score+0
      cat("your score ",  score, "\n")
      
    } else if (user == "scissors" & computer == "rock") {
      print(computer)
      score = score-1
      cat("your score ",  score, "\n")
    } else if (user == "scissors" & computer == "scissors") {
      print(computer)
      score = score+0
      cat("your score ",  score, "\n")
      
    } else if (user == "scissors" & computer == "paper") {
      print(computer)
      score = score+1
      cat("your score ",  score, "\n")
      
      break
    }
  }
}
