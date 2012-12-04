Funkcijas
====

trans.wd.R(file,r.par="RINGWIDTH")
-------

Funkcija pārveido WinDendro radītos .txt failus par datu tabulu, kurā pirmajā kolonnā ir gads, bet visās pārējās kolonnās ir
gadskārtu rindu dati.

Funkcijai jānorāda divi parametri - faila nosaukums (pēdiņās), kurā ir mērījumu dati, kā arī parametrs (r.par=), kuram veidot datu tabulu. Ja parametra veids netiks norādīts, tad automātiski tabula tiks veidota "RINGWIDTH", bet ir iespējams norādīt arī "EARLYWIDTH" un "LATEWIDTH".

Šobrīd funkcija var strādāt tikai ar 3.versijas WinDendro failiem.