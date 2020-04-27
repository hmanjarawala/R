fact <- function(n){
  if(n == 1){
    return(1)
  }else{
    return(n * fact(n-1))
  }
}

input <- 5
print(paste("Value of",input,"! is",fact(input)))