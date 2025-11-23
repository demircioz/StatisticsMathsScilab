//=============================================================================
// EXERCICE2/scripts/ex2-question2.sce
// SAÉ S2.04 – Ex2.2 : Top 10 des pays d’origine (barres + étiquettes)
//=============================================================================
donnees    = csvRead("data.csv", ",", [], "string");
pays_all   = string(donnees(2:$,5));
modalites  = unique(pays_all,"r");
nPays      = size(modalites,1);
eff        = zeros(nPays,1);
for j=1:nPays
    eff(j) = sum(pays_all==modalites(j));
end
[negE,ord] = gsort(-eff,"g","i");
effDesc    = -negE;
modsDesc   = modalites(ord);
topN       = min(10,nPays);
eff10      = effDesc(1:topN);
mods10     = modsDesc(1:topN);

scf(0); clf();
h = bar(1:topN, eff10);
set(h,"thickness",0);

xtitle("Top 10 des pays d’origine","Pays","Effectif");
xgrid();

ax  = gca();
bnd = ax.data_bounds;
y0  = bnd(2,1) - 0.08*(bnd(2,2)-bnd(2,1));

for i=1:topN
    lab = mods10(i)(:);
    pos = i-0.2;
    ht  = xstring(pos,y0,lab);
    set(ht,"font_size",4,"foreground",[1 1 1]);
end
