//////////////////////////////////////////////////////////////////////////////
// SAÉ S2.04 – Ex5 : Addiction selon durée de sommeil (barres + valeurs)
//////////////////////////////////////////////////////////////////////////////

// 1) Lecture du CSV
donneesBrutes    = csvRead("data.csv", ",", [], "string");
enTetes         = donneesBrutes(1, :);
donnees         = donneesBrutes(2:$, :);

// 2) Indices des colonnes pertinentes
idxSommeil      = find(enTetes == "Sleep_Hours_Per_Night");
idxAddiction    = find(enTetes == "Addicted_Score");

// 3) Conversion en vecteurs numériques
N               = size(donnees, "r");
heuresSommeil   = zeros(N, 1);
scoresAddict    = zeros(N, 1);
for i = 1:N
    heuresSommeil(i) = evstr(donnees(i, idxSommeil));
    scoresAddict(i)  = evstr(donnees(i, idxAddiction));
end

// 4) Définition des classes de sommeil et de leurs étiquettes
bornes       = [0 5 7 9 24];
etiquettes   = ["<5h" ; "5-7h" ; "7-9h" ; ">9h"];
nClasses     = size(etiquettes, 1);

// 5) Calcul des moyennes par classe
moyennes     = zeros(nClasses, 1);
for c = 1:nClasses
    sel           = heuresSommeil >= bornes(c) & heuresSommeil < bornes(c+1);
    moyennes(c)   = mean(scoresAddict(sel));
end

// 6) Création de la figure
positions = 1:nClasses;
scf(0); clf();
barHandle = bar(positions, moyennes, 1);
set(barHandle, "thickness", 0);
xtitle("Durée de sommeil et score d’addiction", "Catégorie de sommeil", "Score moyen");

// 7) Grille et étiquettes X
xgrid();
ax = gca();
ax.x_ticks = tlist(["ticks","locations","labels"], positions', etiquettes);

// 8) Affichage des valeurs au-dessus des barres
decalage = max(moyennes) * 0.03;
for c = 1:nClasses
    texte = msprintf("%.2f", moyennes(c));
    xstring(positions(c), moyennes(c) + decalage, texte);
end
