/**************************************************
*****  Exercice 1 - Ah, Final Fantasy VII...  *****
***************************************************/

/*	Définition des personnages	*/
ffvii(personnage(aeris,cetras,soin,19,10000),ifalna).
ffvii(personnage(ifalna,cetras,pnj,6,15000),cloud).
ffvii(personnage(cloud,soldat,heros,18,30000),cloud).
ffvii(personnage(barret,equipe,guerrier,7,14000),cloud).
ffvii(personnage(rougexiii,equipe,soin,18,11000),barret).
ffvii(personnage(yuffie,equipe,ninja,8,2000),barret).
ffvii(personnage(matthias,equipe,ninja,8,2000),nop).

/*	Méthode pour récupérer des informations sur un personnage donné	*/
groupe(X, Y) :- ffvii(personnage(X, Y, _, _, _), _).
xp(X, Y) :- ffvii(personnage(X, _, _, _, Y), _).
chef(X, Y) :- ffvii(personnage(X, _, _, _, _), Y).
popularite(X, Y) :- ffvii(personnage(X, _, _, Y, _), _).

/*	Récursion pour savoir si le membre est valide, avec Cloud en valeur final	*/
membre_valide(cloud).
membre_valide(X) :- chef(X,Y),membre_valide(Y).

/*	
	Vérification de la popularité dans un premier temps
	Vérification qu'après addition l'xp ne dépasse pas celle du personnage
	Exception de cloud inclue
*/
xp_reelle(X, Y) :-
	xp(X, E),(
		popularite(X, P),
		P >= 10,
		chef(X,C),
		xp(C, E2),
		Y3 is E+5000,(
			(Y3 <  E2;X == cloud),
			Y  =  Y3;
			Y3 >= E2,
			Y  =  E2);
		Y = E).

/******************************************************
*****  Exercice 2 - Vous avez dit récursivité...  *****
*******************************************************/
/*On définit le moment ou la fonction s'arrête*/
factorielle(0, 1).

/*Récursivité de la factorielle*/
factorielle(X, Y) :- 
	X2 is X-1, 
	factorielle(X2, Z),
	Y is X*Z.

/**************************************************
**********  Exercice 3 - Suite de Lucas  **********
***************************************************/

/*	Test de vérification pour la validité des variables P et Q	*/
test_entiers(P, Q) :-
	R is P*P-4*Q,
	R \= 0.

/*	Récurrence pour la suite U	*/
u(P, Q, 0, Z) :- Z is 0.
u(P, Q, 1, Z) :- Z is 1.
u(P, Q, N, Z) :-
	N1 is N-1,
	N2 is N-2,
	u(P, Q, N1, Y),
	u(P, Q, N2, W),
	Z is P*Y-Q*W.

/*	Récurrence pour la suite V	*/
v(P, Q, 0, Z) :- Z is 2.
v(P, Q, 1, Z) :- Z is P.
v(P, Q, N, Z) :-
	N1 is N-1,
	N2 is N-2,
	v(P, Q, N1, Y),
	v(P, Q, N2, W),
	Z is P*Y-Q*W.

/*	Affichage de la valeur des suites de Lucas pour un élément N fixe	*/
lucas(P, Q) :-
	test_entiers(P, Q), 
	u(P, Q, 2, ZU),
	v(P, Q, 2, ZV),
	write('U -> '),
	print(ZU),
	nl, write('V -> '),
	print(ZV).


	
	

		





