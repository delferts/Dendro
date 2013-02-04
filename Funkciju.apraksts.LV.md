Funkcijas
====

pointer.year(x)
------

Funkcija aprēķina audzes Pointer-year vērtības no atsevišķu koku vērtībām, salīdzinot konkrētē gada pieaugumu ar iepriekšējo piecu gadu vidējo pieaugumu. Vērtību klases tiek dalītas ik pa 20%.

Funkcijai jānorāda datu tabulu, kurā pirmajā kolonnā ir gads un pārējās kolonnās ir gadskārtu vērtības.


rel.supr(gadsk,sliek=0.5)
------

Funkcija veic Release-Supression analīzi salīdzinot pieaugumu 10 gados (pirmais perioda gads sakrīt ar gadu, kuram apŗēķina) ar iepriekšējo 10 gadu vidējo pieaugumu.

Funkcijai kā argumenti jānorāda datu tabula, kurā pirmajā kolonnā ir gads un pārējās kolonnās ir gadskārtu vērtības. Kā papildus arguments jānorāda slieksnis (izteikts decimālskaitļos), pie kura izmaiņas ir uzskatāmas par būtiskām (noklusētā vērtība ir 0.5 jeb 50%).

Rezultātā ir datu tabulu ar kolonnām: (a) gads - gada vērtība; (b) poz.sk - koku skaits, kas uzrāda pozitīvu pieaugumu konkrētajā gadā; (c) poz.proc - proporcija no kokiem, kas uzrāda pozitīvu pieaugumu; (d) neg.sk - koku skaits, kas uzrāda negatīvu pieaugumu konkrētajā gadā; (e) neg.proc - proporcija no kokiem, kas uzrāda negatīvu pieaugumu; (f) kopa.koki - koku skaits, kas konkrētajā gadā iekļauti analīzē.

trans.wd(file,r.par="RINGWIDTH")
-------

Funkcija pārveido WinDendro radītos .txt failus par datu tabulu, kurā pirmajā kolonnā ir gads, bet visās pārējās kolonnās ir
gadskārtu rindu dati.

Funkcijai jānorāda divi parametri - faila nosaukums (pēdiņās), kurā ir mērījumu dati, kā arī parametrs (r.par=), kuram veidot datu tabulu. Ja parametra veids netiks norādīts, tad automātiski tabula tiks veidota "RINGWIDTH", bet ir iespējams norādīt arī "EARLYWIDTH" un "LATEWIDTH".

Šobrīd funkcija var strādāt tikai ar 3.versijas WinDendro failiem.

fh.tab(fails)
-------

Funkcija pārveido TSAP mērījumu failu (.fh) par .txt failu, kas automātiski tiek saglabāts darba direktorijā. Katra gadskārtu rinda veido vienu rindu jaunajā failā. 

Šobrīd funkcija pieņem, ka mērījumi ir veikti virzienā no mizas uz centru.