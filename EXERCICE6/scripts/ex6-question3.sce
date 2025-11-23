//////////////////////////////////////////////////////////////////////////////
// SAÉ S2.04 – Ex6.3 : Addiction selon nombre de conflits (barres + annotations)
//////////////////////////////////////////////////////////////////////////////

// 1) Lecture du CSV et extraction
donneesBrutes    = csvRead("data.csv", ",", [], "string");
entetes         = donneesBrutes(1, :);
donnees         = donneesBrutes(2:$, :);

// 2) Identification des colonnes
iConflits       = find(entetes == "Conflicts_Over_Social_Media");
iAddict         = find(entetes == "Addicted_Score");

// 3) Conversion en vecteurs
nLignes         = size(donnees, "r");
listeConflits   = donnees(:, iConflits);
scoresAddict    = zeros(nLignes, 1);
for i = 1:nLignes
    scoresAddict(i) = evstr(donnees(i, iAddict));
end

// 4) Moyenne du score par modalité de conflit
modalites       = unique(listeConflits, "r");
nModalites      = size(modalites, 1);
moyennes        = zeros(nModalites, 1);
for k = 1:nModalites
    sel            = listeConflits == modalites(k);
    moyennes(k)    = mean(scoresAddict(sel));
end

// 5) Tracé du diagramme en barres
scf(0); clf();
h = bar(1:nModalites, moyennes);
set(h, "thickness", 0);
xtitle("Addiction vs Conflits", "Nombre de conflits", "Score moyen d''addiction");
xgrid();

// 6) Annotation des valeurs au-dessus des barres
decalage        = max(moyennes) * 0.02;
for k = 1:nModalites
    etiquette   = msprintf("%.2f", moyennes(k));
    xstring(k, moyennes(k) + decalage, etiquette);
end
