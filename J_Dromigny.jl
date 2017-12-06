#Trinome composé de : Romain BERNARD, Loïc BOUTIN, Ivan DROMIGNY
#Auteur : Loïc BOUTIN

function crible(n)
    primes = [nb for nb in range(2,n)]                          #On génère tous les nombres de 2 à n
    for i in primes                                             #Pour chaque élément du tableau généré
        filter!((x -> x % i != 0 || x == i), primes)            #On supprime tous éléments divisible par ce premier (excepté lui-même)
    end
    return primes                                               #On retourne alors les éléments n'ayant pas été filtrés
end

print("Entrez la valeur pour le crible : ")
val = parse(UInt32, readline())
tic()
crible(val)
toc()