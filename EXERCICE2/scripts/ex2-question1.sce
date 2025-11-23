//=============================================================================
// EXERCICE2/scripts/ex2-question1.sce
// SAÉ S2.04 – Exercice 2.1 : Répartition des âges selon le genre (barres groupées)
//=============================================================================

// 1) Lecture du CSV en chaînes
donnees      = csvRead("data.csv", ",", [], "string");

// 2) Extraction des colonnes Age et Gender
ages_all     = strtod(donnees(2:$, 2));
genders_all  = donnees(2:$, 3);

// 3) Calcul des effectifs par tranche d’âge et genre
ages_uniques = unique(ages_all, "r");
n            = length(ages_uniques);
count_f      = zeros(n, 1);
count_m      = zeros(n, 1);
for i = 1:n
    idx        = find(ages_all == ages_uniques(i));
    vals       = genders_all(idx);
    count_f(i) = sum(vals == "Female");
    count_m(i) = sum(vals == "Male");
end
M = [count_f, count_m];

// 4) Tracé du diagramme en barres groupées
scf(0); clf();
h = bar(ages_uniques, M);
set(h(1), "thickness", 0, "background", 5);   // Femmes en rose clair
set(h(2), "thickness", 0, "background", 15);  // Hommes en bleu

// 5) Étiquettes en abscisse via tlist
ax = gca();
ax.x_ticks = tlist(...
  ["ticks","locations","labels"], ...
  ages_uniques', ...
  string(ages_uniques)' ...
);

// 6) Habillage
xtitle("Âges des étudiants selon le genre", "Âge (ans)", "Effectif");
legend(["Femmes","Hommes"], "in_upper_right");
xgrid();
