xtset id year
sum ENT FDI PRI PUB FDIE GRDP PCI UNE URB 
pwcorr ENT FDI PRI PUB FDIE GRDP PCI UNE URB
xtcdf ENT FDI PRI PUB FDIE GRDP PCI UNE URB 
*GROUP A.1: OLS-FEM-REM
regress ENT FDI GRDP UNE URB PCI, cluster(id) 
est store ols1
regress ENT FDIE GRDP UNE URB PCI, cluster(id) 
est store ols2
regress ENT PUB GRDP UNE URB PCI, cluster(id) 
est store ols3

*Robustness check: 
regress PRI FDI GRDP UNE URB PCI
est store ols4
regress PRI FDIE GRDP UNE URB PCI
est store ols5
regress PRI PUB GRDP UNE URB PCI
est store ols6

esttab ols1 ols2 ols3 ols4 ols5 ols6, star(* 0.1 ** 0.05 *** 0.01) 
====
xtreg ENT FDI GRDP UNE URB PCI, fe
est store fixed1
xttest3
xtreg ENT FDIE GRDP UNE URB PCI, fe
est store fixed2
xttest3
xtreg ENT PUB GRDP UNE URB PCI, fe
est store fixed3
xttest3
xtreg PRI FDI GRDP UNE URB PCI, fe
est store fixed4
xttest3
xtreg PRI FDIE GRDP UNE URB PCI, fe
est store fixed5
xttest3
xtreg PRI PUB GRDP UNE URB PCI, fe
est store fixed6

esttab fixed1 fixed2 fixed3 fixed4 fixed5 fixed6, star(* 0.1 ** 0.05 *** 0.01) 

xtreg ENT FDI GRDP UNE URB PCI, re
est store random1
xtreg ENT FDIE GRDP UNE URB PCI, re
est store random2
xtreg ENT PUB GRDP UNE URB PCI, re
est store random3
xtreg PRI FDI GRDP UNE URB PCI, re
est store random4
xtreg PRI FDIE GRDP UNE URB PCI, re
est store random5
xtreg PRI PUB GRDP UNE URB PCI, re
est store random6
xttest0

esttab random1 random2 random3 random4 random5 random6, star(* 0.1 ** 0.05 *** 0.01) 

hausman fixed1 random1
*FEM
hausman fixed2 random2
*FEM
hausman fixed3 random3
*FEM
hausman fixed4 random4
*FEM
hausman fixed5 random5
*FEM
hausman fixed6 random6
*REM

======= *No experience 
xtserial ENT FDI GRDP UNE URB PCI
xtserial ENT FDIE GRDP UNE URB PCI
xtserial ENT PUB GRDP UNE URB PCI
xtserial PRI FDI GRDP UNE URB PCI
xtserial PRI FDIE GRDP UNE URB PCI
xtserial PRI PUB GRDP UNE URB PCI
==========
replace
esttab ols fixed random, star(* 0.1 ** 0.05 *** 0.01) replace

*GROUP B.1: FGLS - PCSE
*FGLS Model:
xtgls ENT FDI GRDP UNE URB PCI, p(h) force
est store gls1
xtgls ENT FDIE GRDP UNE URB PCI, p(h) force
est store gls2
xtgls ENT PUB GRDP UNE URB PCI, p(h) force
est store gls3
xtgls PRI FDI GRDP UNE URB PCI, p(h) force
est store gls4
xtgls PRI FDIE GRDP UNE URB PCI, p(h) force
est store gls5
xtgls PRI PUB GRDP UNE URB PCI, p(h) force
est store gls6
*PCSE Model:
xtpcse ENT FDI GRDP UNE URB PCI, hetonly
est store pcse1
xtpcse ENT FDIE GRDP UNE URB PCI, hetonly
est store pcse2
xtpcse ENT PUB GRDP UNE URB PCI, hetonly
est store pcse3
xtpcse PRI FDI GRDP UNE URB PCI, hetonly
est store pcse4
xtpcse PRI FDIE GRDP UNE URB PCI, hetonly
est store pcse5
xtpcse PRI PUB GRDP UNE URB PCI, hetonly
est store pcse6
esttab gls1 gls2 gls3 gls4 gls5 gls6, star(* 0.1 ** 0.05 *** 0.01) replace
esttab pcse1 pcse2 pcse3 pcse4 pcse5 pcse6, star(* 0.1 ** 0.05 *** 0.01) replace 
*GROUP C.1: INTERACTION 
* Create Interaction Terms (PCI moderates the effect) 
gen PCI_FDI = PCI * FDI 
FOR ORIGINAL 
regress ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI
est store olsi
xtreg ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI, fe
est store fixedi
xtreg ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI, re
est store randomi
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI, panels(heteroskedastic) force
est store glsi
xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI, hetonly
est store pcsei
esttab olsi fixedi randomi glsi pcsei, star(* 0.1 ** 0.05 *** 0.01) replace 

*SUB-REGIONS 
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 1 & id <= 11, panels(heteroskedastic)force
est store gls_001
xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 1 & id <= 11, hetonly
est store pcse_001
. asdoc esttab gls_001 pcse_001, star(* 0.1 ** 0.05 *** 0.01) replace save(01.doc)
===
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 12 & id <= 25, panels(heteroskedastic) force
est store gls_002

xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 12 & id <= 25, hetonly
est store pcse_002
. asdoc esttab gls_002 pcse_002, star(* 0.1 ** 0.05 *** 0.01) replace save(02.doc)
==
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 26 & id <= 39, panels(heteroskedastic) force
est store gls_003

xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 26 & id <= 39, hetonly
est store pcse_003
. asdoc esttab gls_003 pcse_003, star(* 0.1 ** 0.05 *** 0.01) replace save(03.doc)
====
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 40 & id <= 44, panels(heteroskedastic) corr(ar1) force
est store gls_004

xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDIif id >= 40 & id <= 44, hetonly
est store pcse_004

. asdoc esttab gls_004 pcse_004, star(* 0.1 ** 0.05 *** 0.01) replace save(04.doc)
==
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 45 & id <=50, panels(heteroskedastic) corr(ar1) force
est store gls_005

xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 45 & id <=50, hetonly
est store pcse_005
. asdoc esttab gls_005 pcse_005, star(* 0.1 ** 0.05 *** 0.01) replace save(05.doc)
==
xtgls ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 51 & id <= 63, panels(heteroskedastic) corr(ar1) force
est store gls_006
xtpcse ENT FDI PRI PUB FDIE GRDP UNE URB PCI_FDI if id >= 51 & id <= 63, hetonly
est store pcse_006
. asdoc esttab gls_006 pcse_006, star(* 0.1 ** 0.05 *** 0.01) replace save(06.doc)
. asdoc esttab gls_001 pcse_001 gls_002 pcse_002 gls_003 pcse_003, star(* 0.1 ** 0.05 *** 0.01) replace save(Regionals123.doc)
. asdoc esttab gls_004 pcse_004 gls_005 pcse_005 gls_006 pcse_006, star(* 0.1 ** 0.05 *** 0.01) replace save(Regionals456.doc)
*FOR ROBUSTNESS CHECK 
regress ENT FDIN PRI PUB FDIE GRDP UNE URB FDIN_PCI
est store olsii
xtreg ENT FDIN PRI PUB FDIE GRDP UNE URB FDIN_PCI, fe
est store fixedii
xtreg ENT FDIN PRI PUB FDIE GRDP UNE URB FDIN_PCI, re
est store randomii
xtgls ENT FDIN PRI PUB FDIE GRDP UNE URB FDIN_PCI, panels(heteroskedastic) force
est store glsii
xtpcse ENT FDIN PRI PUB FDIE GRDP UNE URB FDIN_PCI, hetonly
est store pcseii
. asdoc esttab olsii fixedii randomii glsii pcseii, star(* 0.1 ** 0.05 *** 0.01) replace save(ROBUST.doc)
