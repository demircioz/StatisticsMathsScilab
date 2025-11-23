//////////////////////////////////////////////////////////////////////////////
// SAÉ S2.04 – Ex4 : Impact de l’usage sur la performance académique
// Regroupement en 4 tranches : faible (0–2h), modéré (2–4h), élevé (4–6h), très élevé (6–12h)
//////////////////////////////////////////////////////////////////////////////

// 1) Chargement des données
donnees = csvRead("data.csv", ",", [], "string");

// 2) Extraction des colonnes pertinentes
usage = strtod(donnees(2:$, 6));              // Avg_Daily_Usage_Hours
perf  = donnees(2:$, 8);                     // Affects_Academic_Performance ("Yes"/"No")

// 3) Création du vecteur de groupes (1–4)
N = length(usage);
grp = zeros(N, 1);
grp(usage <  2)           = 1;                // 0–2h
grp(usage >= 2 & usage < 4) = 2;              // 2–4h
grp(usage >= 4 & usage < 6) = 3;              // 4–6h
grp(usage >= 6)           = 4;                // 6–12h

// 4) Comptage des "Yes"/"No" par groupe
M = zeros(4,2);
for i = 1:4
    sel = find(grp == i);
    M(i,1) = sum(perf(sel) == "Yes");
    M(i,2) = sum(perf(sel) == "No");
end

// 5) Tracé du barplot groupé
scf(0); clf();
h = bar(M);
set(h, "thickness", 0);                      // sans contour

// 6) Titres et grille
xtitle("Impact de l’usage quotidien sur la performance académique", ...
       "Tranche d’usage", "Effectif");
xgrid();

// 7) Étiquettes en abscisse avec texte complet
cats = [
    "Faible (0–2 h)"    ;
    "Modéré (2–4 h)"    ;
    "Élevé (4–6 h)"     ;
    "Très élevé (6–12 h)"
];
a = gca();
a.x_ticks = tlist(["ticks","locations","labels"], (1:4)', cats);

// 8) Légende Yes/No
legend(["Yes","No"], "in_upper_right");
