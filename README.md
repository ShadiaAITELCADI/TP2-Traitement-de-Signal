# TP2- Jeux de mots Synthèse et analyse spectrale d’une gamme de musique

<summary>Table of Contents</summary>
  <ol>      
      <li><a href="#Objectifs">Objectifs</a></li>
      <li><a href="#Jeux de mots">Jeux de mots</a></li> 
      <li><a href="#Synthèse et analyse spectrale d’une gamme de musique">Synthèse et analyse spectrale d’une gamme de musique</a></li> 

      
  </ol>
  
  # Objectifs
 -  Comprendre comment manipuler un signal audio avec Matlab, en effectuant certaines opérations classiques sur un fichier audio d’une phrase enregistrée via un smartphone.
-  Comprendre la notion des sons purs à travers la synthèse et l’analyse spectrale d’une gamme de musique.

>Commentaires : Il est à remarquer que ce TP traite en principe des signaux continus.  Or, l'utilisation de Matlab suppose l'échantillonnage du signal. Il faudra donc >être vigilant par rapport aux différences de traitement entre le temps continu et le temps discret.

>Tracé des figures : toutes les figures devront être tracées avec les axes et les légendes des axes appropriés.

>Travail demandé : un script Matlab commenté contenant le travail réalisé et des commentaires sur ce que vous avez compris et pas compris, ou sur ce qui vous a semblé >intéressant ou pas, bref tout commentaire pertinent sur le TP.

# Jeux de mots

« phrase.wave » est un fichier audio enregistré à l’aide d’un smartphone, en prononçant lentement la phrase : 
 **« Rien ne sert de courir, il faut partir à point »**
 
 1- Sauvegardez ce fichier sur votre répertoire de travail, puis charger-le dans MATLAB à l’aide de la commande « audioread ».
 ```matlab
 [y,fs]=audioread("audio.opus");
 
```
2- Tracez le signal enregistré en fonction du temps,

```matlab
 
[y,fs]=audioread("audio.opus");
N = length(y)
ts = 1/fs
t = (0:N-1)*ts;
plot(t,y)

```
<img width="999" alt="11" src="https://user-images.githubusercontent.com/89936910/210154860-93c6959d-89f2-4ef1-adab-4e7eb3b98def.png">

 >puis écoutez-le en utilisant la commande « sound ».
 
```matlab
 
 sound(y,fs)

```
3- Cette commande permet d’écouter la phrase à sa fréquence d’échantillonnage d’enregistrement. Ecoutez la phrase en modifiant la fréquence d’échantillonnage à double ou deux fois plus petite pour vous faire parler comme « Terminator » ou « Donald Duck ». En effet, modifier la fréquence d’échantillonnage revient à appliquer un changement d’échelle y(t) = x(at) en fonction de la valeur du facteur d’échelle, cela  revient à opérer une compression ou une dilatation du spectre initial d’où la version plus grave ou plus aigüe du signal écouté.
```matlab
 
sound(y,2*Fs); %Donald Duck
sound(y,Fs/2); %Terminator

```
4- Tracez le signal en fonction des indices du vecteur x, puis essayez de repérer les indices de début et de fin de la phrase « Rien ne sert de ».

```matlab
rien_ne_sert_de = y(5055:76000);
plot(rien_ne_sert_de);
title('Rien ne sert de');
```
<img width="775" alt="111" src="https://user-images.githubusercontent.com/89936910/210155189-a11d9535-1445-4cdb-a6ac-41a7108aad67.png">

5- Pour segmenter le premier mot, il faut par exemple créer un vecteur « riennesertde »contenant les n premières valeurs du signal enregistré x qui correspondent à ce 
morceau. Créez ce vecteur, puis écoutez le mot segmenté.

```matlab
rien_ne_sert_de = y(5055:76000);
sound(rien_ne_sert_de,fs);
```

6- Segmentez cette fois-ci toute la phrase en créant les variables suivantes : riennesertde, courir, ilfaut, partirapoint.

