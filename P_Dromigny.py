#!/usr/bin/python2.6
# -*-coding:Latin-1 -*

#Trinome composé de : Romain BERNARD, Loïc BOUTIN, Ivan DROMIGNY
#Author : Ivan DROMIGNY

import time 

def erathostene(n):
	if n < 2:
		return []
	n += 1 														
	tabBool = [False,False] 									# On initialise les deux premières valeur du tableau de booléens à faux (1 et 2)
	tabBool += [True]*(n-2) 									# On initilaise le reste tableau de booléens à vrai
	tabBool[2::2] = [False]*((n-2)//2 + n%2) 					# On met à faux tous les nombres pairs (// pour division en entier)
	tabRes = [2] 												# On initialise le tableau de résultat en y ajoutant 2 (qui est le premier nombre premier)
	racN = int(n**0.5) 											# On calcule la racine carré de n arrondis à l'unité
	racN = racN + [1,0][racN%2] 								# Si la racine de n est pair alors on l'incrémente de 1

	# Une fois qu'on a atteint un nombre premier supérieur à racine de n, il n'y a plus de multiple à supprimer donc on fais deux boucles for
	for i in xrange(3, racN+1, 2):  							# xrange est plus opti que range pour les boucles (pas de beaucoup)
		if tabBool[i]:							
			tabRes.append(i) 									# Si tabBool est vrai on enregistre le nouveau nombre premier
			tabBool[i::i] = [False]*((n-i)//i + int((n-i)%i>0)) # Puis on supprime tous ses multiples du tableau de booléens

	for i in xrange(racN, n, 2):
		if tabBool[i]:
			tabRes.append(i) 									# Si tabBool est vrai on enregistre le nouveau nombre premier
	
	return tabRes    

#Programme réalisé par: CARON Dylan
#Groupe : BROHAN Romain, GASCOIN Samy, CARON Dylan
#Version peu efficace (voir pas du tout)

def era(nb) :
    l = [2] 
    insert = True
    for cpt in [a for a in range(3,nb+1)] :
        for a in l :
            if (cpt % a == 0) :
                insert = False
        if(insert) :
                l.append(cpt)
        insert = True
    return(l)

'''
def etude() :
	for x in [1,10,100,1000,10000,100000,1000000,10000000,100000000]:
		tabRes1 = []
		tabRes2 = []
		t_deb = time.time()
		erathostene(x)
		tabRes1 += time.time()-t_deb

		t_deb = time.time()
		era(x)
		tabRes2 += time.time()-t_deb

	println(tabRes1)
	println(tabRes2)


etude()
'''

def mesure() :
	asum1000 = 0
  	asum100000 = 0
  	bsum1000 = 0
  	bsum100000 = 0

	for x in range(1,11) : 
		t_deb = time.time()
		erathostene(1000)
		asum1000 += time.time()-t_deb
		t_deb = time.time()
		erathostene(100000)
		asum100000 += time.time()-t_deb

		t_deb = time.time()
		era(1000)
		bsum1000 += time.time()-t_deb
		t_deb = time.time()
		era(100000)
		bsum100000 += time.time()-t_deb

	print("Nous 1000 : ")
	print(asum1000/10)
	print("Nous 100000 : ") 
	print(asum100000/10)

	print("Brohan 1000 : ")
	print(bsum1000/10)
	print("Brohan 100000 : ")
	print(bsum100000/10)

mesure()