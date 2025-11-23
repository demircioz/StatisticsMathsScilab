//=============================================================================
// EXERCICE2/scripts/ex2-question3.sce
// SAÉ S2.04 – Ex2.3 : Effectifs par niveau scolaire (graduations texte)
//=============================================================================
donnees     = csvRead("data.csv", ",", [], "string");
niveaux_all = string(donnees(2:$,4));

// Ordre voulu
modalites   = ["Graduate";"High School";"Undergraduate"];
nMod        = size(modalites,1);
eff         = zeros(nMod,1);
for k=1:nMod
    eff(k) = sum(niveaux_all==modalites(k));
end

scf(0); clf();
h = bar(1:nMod, eff);
set(h,"thickness",0);

xtitle("Effectifs par niveau scolaire","Niveau scolaire","Effectif");
xgrid();

ax = gca();
ax.x_ticks = tlist(...
  ["ticks","locations","labels"], ...
  (1:nMod)', ...
  modalites  ...
);
