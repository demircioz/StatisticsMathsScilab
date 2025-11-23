//////////////////////////////////////////////////////////////////////////////
// SAÉ S2.04 – Ex7.1 : Addiction selon santé mentale et genre (barres groupées)
//////////////////////////////////////////////////////////////////////////////

// 1) Lecture du CSV
donneesBrutes    = csvRead("data.csv", ",", [], "string");
entetes         = donneesBrutes(1, :);
lignes          = donneesBrutes(2:$, :);

// 2) Indices des colonnes utiles
iGenre          = find(entetes == "Gender");
iSanteMentale   = find(entetes == "Mental_Health_Score");
iAddiction      = find(entetes == "Addicted_Score");

// 3) Conversion en vecteurs
N               = size(lignes, "r");
genres          = lignes(:, iGenre);
scoresMental    = zeros(N, 1);
scoresAddict    = zeros(N, 1);
for k = 1:N
    scoresMental(k) = evstr(lignes(k, iSanteMentale));
    scoresAddict(k) = evstr(lignes(k, iAddiction));
end

// 4) Détermination des modalités de santé mentale
modalites       = unique(scoresMental, "r");
nModalites      = length(modalites);

// 5) Calcul des moyennes par modalité et par genre
moyennesF       = zeros(nModalites, 1);
moyennesH       = zeros(nModalites, 1);
for j = 1:nModalites
    selF = find((scoresMental == modalites(j)) & (genres == "Female"));
    selH = find((scoresMental == modalites(j)) & (genres == "Male"));
    moyennesF(j) = mean(scoresAddict(selF));
    moyennesH(j) = mean(scoresAddict(selH));
end

// 6) Tracé du diagramme en barres groupées
scf(0); clf();
hBar = bar([moyennesF, moyennesH]);
set(hBar, "thickness", 0);

// 7) Personnalisation de l’axe X : on remplace les graduations
ax     = gca();
positions = (1:nModalites)';              // vecteur colonne [1;2;…]
labels    = string(modalites);            // vecteur colonne de chaînes
ax.x_ticks = tlist(["ticks","locations","labels"], positions, labels);

// 8) Titres, légende et grille
xtitle("Score moyen d’addiction selon la santé mentale et le genre", ...
       "Score santé mentale", "Score addictif moyen");
legend(["Femmes","Hommes"], "upper_right");
xgrid();

// 9) Annotation des barres (valeurs au-dessus)
decalage = max([moyennesF; moyennesH]) * 0.03;
for j = 1:nModalites
    // femmes à j–0.15, hommes à j+0.15
    xstring(j-0.15, moyennesF(j) + decalage, msprintf("%.2f", moyennesF(j)));
    xstring(j+0.15, moyennesH(j) + decalage, msprintf("%.2f", moyennesH(j)));
end
