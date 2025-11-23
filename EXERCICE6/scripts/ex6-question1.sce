//////////////////////////////////////////////////////////////////////////////
// SAÉ S2.04 – Ex6 : Nuage de points Sommeil vs Usage par genre
//////////////////////////////////////////////////////////////////////////////

// 1) Chargement et conversion
donnees       = csvRead("data.csv", ",", [], "string");
heuresSommeil = strtod(donnees(2:$, 9));   // Sleep_Hours_Per_Night
heuresUsage   = strtod(donnees(2:$, 6));   // Avg_Daily_Usage_Hours
genres        = donnees(2:$, 3);           // "Female"/"Male"

// 2) Indices par genre
idxF = find(genres == "Female");
idxM = find(genres == "Male");

// 3) Nuage de points
scf(0); clf();
// Femmes en rouge
scatter(heuresUsage(idxF), heuresSommeil(idxF), 5, color("red"));
// Hommes en bleu
scatter(heuresUsage(idxM), heuresSommeil(idxM), 5, color("blue"));

// 4) Habillage
xtitle("Sommeil vs Usage quotidien par genre", "Heures d’usage/jour", "Heures de sommeil/nuit");
legend(["Femmes","Hommes"], "upper_right");
xgrid();
