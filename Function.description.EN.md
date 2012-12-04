Functions
====

trans.wd.R(file,r.par="RINGWIDTH")
-------

Function transforms WinDendro .txt files to data frame, where first column contains year and the rest columns are tree ring measurament data.

Function needs to parameters - name of the WinDendro file (quoted), and which parameter to use (r.par=). If parameter is not given, then "RINGWIDTH" will be used. Other possibilities are "EARLYWIDTH" and "LATEWIDTH".

At this moment function works only with version 3 WinDendro files.