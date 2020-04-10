# Program to calculate n!

n <- 10
nfact <- 1
i <- 1

while (i <= n) {
  nfact <- nfact * i
  i <- i + 1
}

print(paste("value of", (i-1), "! is", nfact))