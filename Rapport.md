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

* Le premium est le prix de l'option
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
  Le bénéfice va être de 0. Mais plutôt deficit car il va percevoir -> -__Premium__-__(ST-K)

* __Le payoff noté T__
Au final, le flux de trésorerie en
T = Max(ST−K,0)

#### Conclusion partie théorie des options

  Pour l'instant je clos cette partie à ce niveau la bien qu'il reste encore beaucoup de choses à savoir à propos des options, nottement sur le profit lié à l'achat ou la vente d'une option (call ou put), mais pour l'instant, c'est suffisant pour comprendre l'analyse du set de données soumis à notre étude dans la partie qui va suivre.

### Préparation, manipulation et observation des données :
 
