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
