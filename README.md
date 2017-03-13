# Die zylindrische Multipolentwicklung und ihre Anwendung bei der Magnetokardiographie
English title: "The cylindrical multipol expansion and its application to magnetocardiography"

Code zur Masterarbeit.

Die Arbeit ist auf ResearchGate zu finden:

[DOI: 10.13140/RG.2.2.24448.43520](https://www.researchgate.net/publication/314880996_Die_zylindrische_Multipolentwicklung_und_ihre_Anwendung_bei_der_Magnetokardiographie)

## Struktur

```
./
->fourier
->lib
```

Im Ordner Lib sind Funktionen die regelmäßig verwendent werden, und quasi basisfunktionen darstellen.

Im ordner Fourier sind verschiedene Fourierentwicklungen für ein Diüpol in Z-richtung zu finden. Die Entwicklungen sind äquivalen zu kap. 2 Der Masterarbeit.

Das Prbogramm Abschirmung_B_all errechnet die zylindrische Multipolentwicklung in Matrizenform.

Das Programm genAmplituden bzw. genAmplituden_ohne_interp berechnet die Multipolampituden nach dem kap. 2.5 der Masterarbeit, mit und ohne Interpolation.

Das Programm fehler kann zum Berechnen der fehler nach der in der MA beschribenen Formel verwendet werden.

Das Programm test errechnet die Multipolampituden nach dem Taulu et.al. Es gibt Fehler aus, nach einer Methode die nicht mehr verwendet wird.

Das Programm gen_B berechnet das Feld eines Dipols auf einem Zylinder.

Die SensorPos programme erzeugen verschiedene Sensorarrays.

Die MUSIC Programme implemetieren verschiedene verfahren nach Mosher zur Quellokalisation, z.T. analog zu kapitel 3.3 der Masterarbeit.

## Erzeugung der Mutlipolentwicklung und rekonstruktion des Feldes

Um eine Entwicklung durchzuführen, mittels der Fourierbasierten Methode mit interpolation mit nu_max = 10 und kappa_max = 40 und ermittlung derne Fehler:

```
SensorPosZyl
gen_B
[A_i_R_Zyl,A_a_R_Zyl] = genAmplitunden(P_R,P_Phi,P_Z,B_R_Zyl,10,40,l,1,r_1,r_2);
Abschirmung_B_all
fehler
```

fehler wird eine fehlermeldung werfen, dan nur die Radialkomponente implementiert ist.  
  
Für eine Kugel nach Taulu et. al. mit n_max = 10

```
SensorPosKugel2
gen_B
AbschirmungKugel
test
fehler
```

## Troubleshooting

Wenn die Programme nicht mehr laufen sollten, sollten entweder die Funktionen aus lib in den Programm oderner Kopiert werden, oder bei Matlab der Path zu lib hinzugefügt werden (File-> SetPath -> Add Folder)

## Kontakt

andreas.gocht@gmail.com