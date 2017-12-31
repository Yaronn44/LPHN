#Trinome composé de : Romain BERNARD, Loïc BOUTIN, Ivan DROMIGNY
#Auteur : Loïc BOUTIN
#Ceci est le code peu efficace

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

function RAtoast(n)
    T=trues(n)
    i=0
    j=0
    for i = 2:n
        if T[i]==true
           j=(2*i)
            while j<=n
                T[j]=false
                j=j+i 
            end
        end
    end
      return [i for i in 2:n if T[i]==true]
end


function mesure()

	asum1000 = 0
  	asum100000 = 0
  	bsum1000 = 0
  	bsum100000 = 0

	for i = 1:10
		tic()
		crible(1000)
		asum1000 += toc()
		tic()
		crible(100000)
		asum100000 += toc()

		tic()
		RAtoast(1000)
		bsum1000 += toc()
		tic()
		RAtoast(100000)
		bsum100000 += toc()
	end

	print("Nous 1000 : ")
	print(asum1000/10)
	print("Nous 100000 : ") 
	print(asum100000/10)

	print("Brohan 1000 : ")
	print(bsum1000/10)
	print("Brohan 100000 : ")
	print(bsum100000/10)

end