//=============================================================================
// EXERCICE2/scripts/ex2-question4.sce
// SAÉ S2.04 – Ex2.4 : Distribution par tranches (1–2, 2–3, …)
//=============================================================================
donnees    = csvRead("data.csv", ",", [], "string");
usage_all  = strtod(donnees(2:$,6));

edges   = 1:1:9;
nCls    = length(edges)-1;
counts  = zeros(nCls,1);
for k=1:nCls
    counts(k) = sum(usage_all>=edges(k) & usage_all<edges(k+1));
end

xvals = (edges(1:$-1)+edges(2:$))/2;

scf(0); clf();
h = bar(xvals,counts,1);
set(h,"thickness",0);

xtitle("Distribution du temps moyen d’utilisation","Tranche (h)","Effectif");
xgrid();

labels = [];
for k=1:nCls
    labels(k,:) = msprintf("%d-%d",edges(k),edges(k+1));
end

ax = gca();
ax.x_ticks = tlist(...
  ["ticks","locations","labels"], ...
  xvals', ...
  labels ...
);
