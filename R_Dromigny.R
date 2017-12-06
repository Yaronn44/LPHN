#Trinome compos� de : Romain BERNARD, Lo�c BOUTIN, Ivan DROMIGNY
#Auteur : Romain BERNARD

r_atosthene = function(n) {
  
  tab = c(2:n)
  i=1
  
  while (tab[i]^2 <= n) {
    tab = tab[tab %% tab[i] != 0 | tab==tab[i]] #
    i = i + 1
  }
  return (tab)
}

system.time(r_atosthene(1000000))