//=============================================================================
// EXERCICE1/scripts/ex1-question2.sce
// SAÉ S2.04 – Exercice 1.2 : Effectifs des variables qualitatives
//=============================================================================

// 1) Chargement du fichier en chaînes
donnees = csvRead("data.csv", ",", [], "string");

// 2) Indices et noms des colonnes qualitatives
indices_qual = [3, 4, 5, 7, 8, 11];
noms_qual    = [ ...
  "Gender", ...
  "Academic_Level", ...
  "Country", ...
  "Most_Used_Platform", ...
  "Affects_Academic_Performance", ...
  "Relationship_Status" ...
];

// 3) Boucle pour chaque variable qualitative
for k = 1:length(indices_qual)
    col    = indices_qual(k);
    nomVar = noms_qual(k);

    // 3.1 Extraction et nettoyage
    valeurs = string(donnees(2:$, col));
    mask    = (valeurs <> "") & (valeurs <> "NaN");
    valeurs = valeurs(mask);

    // 3.2 Comptage des occurrences
    [modalites, tmp, idxMod] = unique(valeurs);
    nMod     = size(modalites, 1);
    effectifs = zeros(nMod, 1);
    for i = 1:length(idxMod)
        effectifs(idxMod(i)) = effectifs(idxMod(i)) + 1;
    end

    // 3.3 Tri décroissant par inversion
    [negEff, ordre] = gsort(-effectifs, "g", "i");
    effTrie        = -negEff;
    modsTrie       = modalites(ordre);

    // 3.4 Affichage
    mprintf("\n--- %s ---\n", nomVar);
    for i = 1:nMod
        mprintf("%s : %d\n", modsTrie(i), effTrie(i));
    end
end
