//////////////////////////////////////////////////////////////////////////////
// SAÉ S2.04 – Ex6.2 : Sommeil vs Usage par genre (points colorés + régression)
//////////////////////////////////////////////////////////////////////////////

// 1) Lecture CSV et extraction des colonnes
M          = csvRead("data.csv", ",", [], "string");
enTetes    = M(1, :);
raw        = M(2:$, :);
idxUsage   = find(enTetes == "Avg_Daily_Usage_Hours");
idxSommeil = find(enTetes == "Sleep_Hours_Per_Night");
idxGenre   = find(enTetes == "Gender");

// 2) Conversion en vecteurs numériques et catégorisation
N          = size(raw, "r");
usage      = zeros(N, 1);
sleepH     = zeros(N, 1);
genre      = raw(:, idxGenre);
for i = 1:N
    usage(i)  = evstr(raw(i, idxUsage));
    sleepH(i) = evstr(raw(i, idxSommeil));
end
idxHommes  = genre == "Male";
idxFemmes  = genre == "Female";

// 3) Nuage de points
scf(0); clf();
// Hommes en bleu 'o'
plot(usage(idxHommes),  sleepH(idxHommes),  'ob');
// Femmes en rouge 'o'
plot(usage(idxFemmes), sleepH(idxFemmes), 'or');

// 4) Régression linéaire sur l'ensemble des données
coeffs = polyfit(usage, sleepH, 1);
a      = coeffs(1);
b      = coeffs(2);
xR     = [min(usage); max(usage)];
yR     = a*xR + b;
// tracer la droite en vert en pointillé
plot(xR, yR, '--g');

// 5) Habillage
xlabel("Usage quotidien (heures)");
ylabel("Heures de sommeil par nuit");
title("Sommeil vs Usage par genre avec régression");
legend(["Hommes","Femmes","Régression"], ...
       "southoutside", "orientation", "horizontal");
xgrid();
