//=============================================================================
// EXERCICE3/scripts/ex3-question1.sce
// SAÉ S2.04 – Ex3.1 : Boxplot du temps d’usage selon tranches d’âge
// Auteurs : Canpolat DEMIRCI-ÖZMEN & Nathan LAUNAY
// Professeur : Denis MONNERAT
//=============================================================================

// 1) Charger la toolbox stixbox
atomsLoad("stixbox");

// 2) Lecture et préparation des données
donnees    = csvRead("data.csv", ",", [], "string");
ages_all   = strtod(donnees(2:$,2));   // Age
usage_all  = strtod(donnees(2:$,6));   // Avg_Daily_Usage_Hours

// 3) Construction des groupes : 16–20 → 1, 21–25 → 2
grp_num    = zeros(size(ages_all,1),1);
grp_num(ages_all>=16 & ages_all<=20) = 1;
grp_num(ages_all>=21 & ages_all<=25) = 2;

// 4) Filtrage des données valides
mask       = grp_num > 0;
data_vals  = usage_all(mask);
grp_vals   = grp_num(mask);

// 5) Conversion des codes en labels (string vector)
n          = length(data_vals);
grp_lbl    = [];                     // initialisation
for i = 1:n
    if grp_vals(i) == 1 then
        grp_lbl(i,1) = "16-20";
    else
        grp_lbl(i,1) = "21-25";
    end
end

// 6) Tracé du boxplot
scf(0); clf();
boxplot(data_vals, grp_lbl);

// 7) Habillage
xtitle("Usage moyen des réseaux selon tranche d’âge", "Tranche d’âge", "Heures/jour");
xgrid();
