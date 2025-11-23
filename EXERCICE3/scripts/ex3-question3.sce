//=============================================================================
// EXERCICE3/scripts/ex3-question3.sce
// SAÉ S2.04 – Ex3.3 : Boxplot du score d’addiction selon le niveau académique
// Auteurs : Canpolat DEMIRCI-ÖZMEN & Nathan LAUNAY
//=============================================================================

// 1) Charger la toolbox stixbox
atomsLoad("stixbox");

// 2) Lecture et préparation des données
donnees      = csvRead("data.csv", ",", [], "string");
niveau_all   = string(donnees(2:$,4));     // Academic_Level  
addicted_all = strtod(donnees(2:$,13));    // Addicted_Score

// 3) Filtre des enregistrements valides
mask         = (niveau_all <> "") & (addicted_all <> %nan);
data_vals    = addicted_all(mask);
grp_vals     = niveau_all(mask);           // chaînes : niveaux

// 4) Tracé du boxplot
scf(0); clf();
boxplot(data_vals, grp_vals);

// 5) Habillage
xtitle("Score d’addiction selon niveau académique", "Niveau académique", "Score d’addiction");
xgrid();
