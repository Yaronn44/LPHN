#!/usr/bin/python2.6
# -*-coding:Latin-1 -*

#Ce projet a été réalisé en collaboration avec Romain Bernard et Loïc Boutin

def erathostene(n):
	if n < 2:
		return []
	n += 1 # On incrémente n car 
	tabBool = [False,False] 									# On initialise les deux premières valeur du tableau de booléens à faux (1 et 2)
	tabBool += [True]*(n-2) 									# On initilaise le reste tableau de booléens à vrai
	tabBool[2::2] = [False]*((n-2)//2 + n%2) 					# On met à faux tous les nombres pairs (// pour division en entier)
	tabRes = [2] 												# On initialise le tableau de résultat en y ajoutant 2 (qui est le premier nombre premier)
	racN = int(n**0.5) 											# On calcule la racine carré de n arrondis à l'unité
	racN = racN + [1,0][racN%2] 								# Si la racine de n est pair alors on l'incrémente de 1

	# Une fois qu'on a atteint un nombre premier supérieur à racine de n, il n'y a plus de multiple à supprimer donc on fais deux boucles for
	for i in xrange(3, racN+1, 2):  							# xrange est plus opti que range pour les boucles (pas de beaucoup)
		if tabBool[i]:							
			tabRes.append(i) 										# Si tabBool est vrai on enregistre le nouveau nombre premier
			tabBool[i::i] = [False]*((n-i)//i + int((n-i)%i>0)) # Puis on supprime tous ses multiples du tableau de booléens
	for i in xrange(racN, n, 2):
		if tabBool[i]:
			tabRes.append(i) 										# Si tabBool est vrai on enregistre le nouveau nombre premier
	return tabRes    

val = input('Entrez la valeur pour le crible : ')
print 'Le résultat est : ', erathostene(val)