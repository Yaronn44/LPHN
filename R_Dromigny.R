#Trinome composé de : Romain BERNARD, Loïc BOUTIN, Ivan DROMIGNY
#Auteur : Romain BERNARD

r_atosthene = function(n) {
  
  tab = c(2:n) #On omet immédiatement 1
  i=1 #Itérateur dans le tableau
  
  #Une fois que le carré de la plus grande valeur étudiée est supérieur à n, on n'a plus de nombres à supprimer => STOP
  while (tab[i]^2 <= n) {
    tab = tab[tab %% tab[i] != 0 | tab==tab[i]] #Syntaxe pour filtrer le tableau ressemblant à 
                                                #la déclaration conditionelle d'un ensemble, ne pas oublier la seconde 
                                                #partie de la condition, sinon des nombres premiers se suppriment eux-mêmes
    i = i + 1
  }
  return (tab)
}

val = readline("Entrez la valeur pour le crible : ")
print(system.time(r_atosthene(as.integer(val))))

crible <- function(n) {
  tab <- c(1:n) >0 
  cpt <- 2 
  tab[1]= FALSE
  while(cpt <= n){
    if(tab[cpt] == TRUE){
      i <- cpt*2
      while(i <= n){
        tab[i] <- FALSE
        i <- i + cpt
      }
    }
    cpt <- cpt +1
  }
  return (which(tab))
}

mesure <- function() {
  asum1000 <- 0
  asum100000 <- 0
  bsum1000 <- 0
  bsum100000 <- 0
  
  for (i in 1:10) {
    asum1000 <- asum1000 + system.time(r_atosthene(1000))
    asum100000 <- asum100000 + system.time(r_atosthene(100000))

    bsum1000 <- bsum1000 + system.time(crible(1000))
    bsum100000 <- bsum100000 + system.time(crible(100000))
  }

  print("------------- Nous ----------- 
        1000 : ")
  print(asum1000/10)
  print("1000000 : ")
  print(asum100000/10)
  print("------------ Brohan ---------- 
        1000 : ")
  print(bsum1000/10)
  print("1000000 : ")
  print(bsum100000/10)
}

