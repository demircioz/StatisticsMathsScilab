//=============================================================================
// EXERCICE2/scripts/ex2-question5.sce
// SAÉ S2.04 – Ex2.5 : Effectifs par plateforme la plus utilisée
//=============================================================================
donnees       = csvRead("data.csv", ",", [], "string");
plats_all     = string(donnees(2:$,7));
mods          = unique(plats_all,"r");
nMod          = size(mods,1);
eff           = zeros(nMod,1);
for k=1:nMod
    eff(k) = sum(plats_all==mods(k));
end
[negE,ord]  = gsort(-eff,"g","i");
effDesc     = -negE;
modsDesc    = mods(ord);

scf(0); clf();
h = bar(1:nMod, effDesc);
set(h,"thickness",0);

xtitle("Effectifs par plateforme la plus utilisée","Plateforme","Effectif");
xgrid();

labels = [];
for k=1:nMod
    labels(k,:) = modsDesc(k)(:);
end

ax = gca();
ax.x_ticks = tlist(...
  ["ticks","locations","labels"], ...
  (1:nMod)', ...
  labels ...
);
