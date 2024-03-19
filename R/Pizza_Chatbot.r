menu <- data.frame(
  menu = c("seafood Cocktail", "seafood Deluxe", "tom yum kung", "spicy Seafood", "shrimp ocktail"),
  price = c(299, 309, 279, 319, 299)
)

pizza_order <- function(){
  
   name <- readline("Hello what should I call you ?: ")
   cat("Hi! ", name, " Wellcome to PIZZA CARROT!!", "\n",
           " ", "\n",
           "PIZZA MENU", "\n") 
   print(menu)
   total_price <- 0              # Initialize total_price outside the loop
  
   while (TRUE) { 
     order <- readline("Please select order by list number ('no' to finished): ") 
       print(menu)
     if (order == "no") {
       break                     # Exit the loop if user inputs "no"
     }
     
     order <- as.numeric(order)  # Convert input to numeric
     if (order >= 1 && order <= nrow(menu)){
       cat(menu$menu[order], "is", menu$price[order], "THB\n")
       price <- as.numeric(menu$price[order])
       total_price <- total_price + price # Accumulate total price
       cat("Amount: ", total_price , "THB \n")
       
     } else {
       print("Invalid selection. Please try again.")
     }
   }
   
   cat("Thank your", name, "!!!\n",
       "Your total amount is: ", total_price, "THB", "\n")  # Print the total amount
}

pizza_order()
