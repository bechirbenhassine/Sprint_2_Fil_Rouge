# Analyse exploratoire sur un set de données d'options financières
## Introduction
  Le rapport ci dessous va se decomposer en deux parties, une premiere qui va porter sur la théorie des options financière afin de comprendre le principe et d'avoir le vocabulaire prérequis pour comprendre les enjeux du sujet, une deuxieme qui va simplement decortiquer les operations réalisées sur le set de données d'un point de vue de programmation, et enfin analyser les résultats obtenus.
### La théorie des options financieres
#### Les produits dérivés
  Un produit dérivé est un actif financier dépendant d’autres variables plus
  fondamentales (appelées sous jacent) comme une action, un taux de change
  ou une matière première. Nous allons nous focaliser dans un premier temps sur les __contrats forward__ ainsi que les __options__

* Un contrat forward
  Un engagement ferme (une obligation) à acheter ou vendre un actif à une date future donnée et à un prix convenu.

* Une option
  Donne le droit (et non l’obligation) d’acheter ou de vendre un actif à une date future donnée et à un prix convenu. (Les call & les put).
  Il faut noter qu'une option sur le marché européen doit arrivée à maturité pour qu'elle puisse être exercée tandis que sur le marché américain, on peut l'exercer avant la date de maturitée fixée initialement.

  Un exemple concret pour illustrer ces propos, on décide d'acquerir une __option d'achat (un Call)__ sur une action Total à un strike de 50€ d'un maturité de 3 mois.
  Aujourd'hui l'action total coute 49.22€  et dans 3 mois, on suppose que l'action va grimper à 53€, on pourra alors acheter notre action Total à 50€ (le prix du strike) grâce à l'option d'achat qu'on a acqueris. c'est ce qu'on appelle "exercer notre option". Dans le cas où l'action Total au bout du 3eme mois est en dessous des 50€ (par exemple 48€), il n'y a alors aucun interet d'exercer notre call car on ne fera pas de benefice.   
  Le __put__ est basé sur le même principe, sauf que c'est __option de vente__

#### Les intervenants
  En tant que vendeur de produits dérivés, il existe trois profils de vendeur :

* Les hedgers
  Utilisent les produits pour réduire l’exposition à un risque donné (risque de change, risque climatique, etc...).
* Les spéculateurs
  Font des paris souvent risqués sur l’évolution du cours d’un sous jacent.
  Approche risqué et parfois controversée, et d'une maniere indirecte, ils assurent la liquidité des marchés
* Les arbitragistes:
  Détectent et profitent des incohérences du marché (arbitrages) qui sont des mises en défaut de la main invisible.
  ces intervenants ont une Approche opportuniste.
  Un exemple pédagogique d’arbitrage: un produit est coté à deux prix différents sur deux marchés différents.
  Leur existence assure que les opportunités d’arbitrage _"O.A"_ sont rares et surtout éphémeres car ils rétablissent par leur action la loi de l’offre et de la demande

#### Vocabulaire, explication des concepts
###### Caracteristique d'une option d'achat (Call)

* Le __premium__ est le prix de l'option
* Date d’échéance du contrat __T__
* Actif sous jacent dont le cours est noté __(St)t∈[0,T]__
* Prix d’exercice (strike) __K__ auquel on peut acheter une unité (en général plusieurs) de sous jacent.

* Une option est dite __européenne__ lorsque le contrat ne peut être exécuté qu’à __T__.
* Une option est dite __américaine__ lorsque le contrat peut être exécuté à toute date entre __0 et T__

  Une option d’achat est dite :
* __dans la monnaie__ ou __in the money__  si __ST>K__

  le detenteur de l’option a intérêt à l’exercer, en effet, il peut acheter une action au prix K
  et la revendre immédiatement.
  Le bénéfice est ST−K.

* __à la monnaie__ ou __at the money__  si __ST = K__

  Le detenteur fait ce qu'il veut. Le bénéfice est de 0. Mais attention, l'option a un prix, donc son deficit sera de -__Premium__

* __en dehors de la monnaie__ ou __out the money__ si __ST<K__

  le détenteur de l’option a intérêt à ne pas l’exercer.
  Le bénéfice va être de 0. Mais plutôt deficit car il va percevoir -> -__Premium-(ST-K)__

* __Le payoff noté T__
Au final, le flux de trésorerie en
__T = Max(ST−K,0)__

#### Conclusion partie théorie des options

  Pour l'instant je clos cette partie à ce niveau la bien qu'il reste encore beaucoup de choses à savoir à propos des options, nottement sur le profit lié à l'achat ou la vente d'une option (call ou put), mais pour l'instant, c'est suffisant pour comprendre l'analyse du set de données soumis à notre étude dans la partie qui va suivre.

### Préparation, manipulation et observation des données

#### Les données

![donnes view](/screenshots/basic-data-view.png)

  On peut observer sur ce tableau la volatilité implicite d'options en fonction du prix de leur strike, ainsi que le niveau de maturité de chaque contrat .

  * En colonne ( colonne verte ) : Prix du strike, qui va de 800 à 10 000
  * En ligne (ligne jaune ) : niveau de maturité de l'option allant de 25 à 0.3 années avant maturité
  * Dans les cellules (cellules blanches) : Se trouve la volatilité implicite des options
#### Analyse des données

##### Etude de l'evolution de laa volatilité implicite de l'option, en fonction de la maturité (strike fixé)

on remarque que lorsque le strike est low (entre 800 et 1400) , la vola implicite decroit au fur et a mesure qu'on remonte dans la maturité et reste plus ou moins stable aux alentours de 0.40
![screen1](/screenshots/screen1.png)

a partir du strike 1500 jusqu'a à 2600 la vola implicite descends autour des 0.30 et puis commence à avoir un mouvement assez volatile en fonction de la maturité
![screen2](/screenshots/screen2.png)


a partir du strike 2700 jusqu'à 3000 on observe une stabilisation de la volatilité implicite qui a tendance à correler positivement avec la maturité de l'option. va de 0.22 et va stagner aux environs de 0.30
![screen3](/screenshots/screen3.png)

entre 3800 et 6000 on observe encore une fois un mouvement qui n'est pas stable, autour d'une maturité implicite qui se situe autour des 0.28 cette fois ci .
![screen4](/screenshots/screen4.png)

###### mot de la fin
Globalement on peut observer que la volatilité implicite atteint toujours un pic lorsque'elle a bientôt atteint sa maturité finale (lorsque elle arrive a bout de maturité, c'est à dire entre 0.3 et 2.3ans), et que pour certains strike la volatilité implicite a tendance a virvolter tandis que pour d'autre elle se stabilise.


##### Constatation de la formation du smile de volatilité

En fixant la maturité et en faisant evoluer le strike, on peut observer les "smile" de volatilité.
Ce terme désigne l'effet d'une augmentation de la volatilité implicite d'une option au fur et à mesure que son prix
d'exercice est éloigné du prix du sous-jacent, représenté graphiquement sous forme d'une courbe mettant en relation
les prix d'exercice d'une série d'options avec la même échéance et le même sous-jacent, et leur volatilité implicite
respective.

![screen5](/screenshots/screen5.png)


##### Estimation sur le prix du sous jacent de l'option

N'ayant aucune information sur le type d'option, le sous jacent en question ainsi que son prix, nous nous somme basés sur le minimum qu'atteint la courbe de smile de volatilité pour donner une estimation du prix,
car on prend le point ou la volatilité est le moins elevé pour une maturité donnée, qui veut dire que c'est le point ou le sous jacent est le moins eloigné de son prix veridique et on obtiens les resultats suivants :


 "Price :3000 euros  - Maturity : 0,3"
 "Price :3800 euros  - Maturity : 1,3"
 "Price :3800 euros  - Maturity : 2,3"
 "Price :4000 euros  - Maturity : 3,3"
 "Price :4400 euros  - Maturity : 4,3"
 "Price :4000 euros  - Maturity : 5,3"
 "Price :5000 euros  - Maturity : 6,3"
 "Price :4400 euros  - Maturity : 7,3"
 "Price :4400 euros  - Maturity : 8,3"
 "Price :4400 euros  - Maturity : 9,3"
 "Price :4000 euros  - Maturity : 15"
 "Price :4000 euros  - Maturity : 20"
 "Price :3800 euros  - Maturity : 25"

On peut alors supposer que le prix du sous jacent est compris entre 3800 et 4000 euros, et qu'on traite bien un seul sous jacent avec differents strikes
