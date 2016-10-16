
## Mutate Dataset
f <- function(){
  dataset <-  c(1,2,3,4,5,6,7,8)
  even <- c() 
  for (i in dataset){
      if(i%%2 ==0){
        even <- c(even, i)
      }
  }
   dataset <- even
   '123123' + 3
   dataset <- sum(dataset)
   dataset
}

# Immutable dataset
dataset <-  c(1,2,3,4,5,6,7,8)
g <- function(dataset){
  dataset[dataset %% 2 ==0 ]
}

sum(g(dataset))
