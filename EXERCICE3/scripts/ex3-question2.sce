//=============================================================================
// EXERCICE3/scripts/ex3-question2.sce
// SAÉ S2.04 – Ex3.2 : Boxplot du temps d’usage selon le genre
// Auteurs : Canpolat DEMIRCI-ÖZMEN & Nathan LAUNAY
//=============================================================================

// 1) Charger la toolbox stixbox
atomsLoad("stixbox");

// 2) Lecture et préparation des données
donnees     = csvRead("data.csv", ",", [], "string");
usage_all   = strtod(donnees(2:$,6));   // Avg_Daily_Usage_Hours
genders_all = donnees(2:$,3);           // "Female"/"Male"

// 3) Tracé du boxplot groupé par genre
scf(0); clf();
boxplot(usage_all, string(genders_all));

// 4) Habillage
xtitle("Usage moyen des réseaux selon le genre", "Genre", "Heures/jour");
xgrid();
