# TP2- Jeux de mots Synthèse et analyse spectrale d’une gamme de musique


<img width="999" alt="33333333333" src="https://user-images.githubusercontent.com/89936910/210168128-3f8b6049-33ad-415c-9045-6f0b7aacab70.png">


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
<img width="999" alt="111" src="https://user-images.githubusercontent.com/89936910/210155189-a11d9535-1445-4cdb-a6ac-41a7108aad67.png">

5- Pour segmenter le premier mot, il faut par exemple créer un vecteur « riennesertde »contenant les n premières valeurs du signal enregistré x qui correspondent à ce 
morceau. Créez ce vecteur, puis écoutez le mot segmenté.

```matlab
rien_ne_sert_de = y(5055:76000);
sound(rien_ne_sert_de,fs);
```

6- Segmentez cette fois-ci toute la phrase en créant les variables suivantes : riennesertde, courir, ilfaut, partirapoint.
```matlab

rien_ne_sert_de = y(5055:76000);

courir  = y(76000:95395);

il_faut = y(95395:141652);

partir_a_point  = y(141652:198500);
```

7- Notez que le signal initial de parole est un vecteur colonne contenant un certain nombre de valeurs (length(x)). Réarrangez ce vecteur pour écouter la phrase synthétisée « Rien ne sert de partir à point, il faut courir ». 

```matlab
vector =[rien_ne_sert_de ; partir_a_point ; il_faut ; courir];
sound(vector,fs);
```


# Synthèse et analyse spectrale d’une gamme de musique

- **Synthèse d’une gamme de musique**

>Les notes de musique produites par un piano peuvent être synthétisées approximativement numériquement. En effet, chaque note peut être considérée comme étant un son pur >produit par un signal sinusoïdal. La fréquence de la note « La » est par exemple de 440 Hz.

1- Créez un programme qui permet de jouer une gamme de musique. La fréquence de chaque note est précisée dans le tableau ci-dessous. Chaque note aura une durée de 1s. La durée de la gamme sera donc de 8s. La fréquence d’échantillonnage fe sera fixée à 8192 Hz.

 Dol  | Ré  | Mi  | Fa  | Sol  | la  | Si  | Do2  |
|---|---|---|---|---|---|---|---|
| 262 Hz  | 294 Hz  | 330 Hz  | 349 Hz  | 392 Hz  | 440 Hz  | 494 Hz  | 523 Hz  |

```matlab
 clear all
  close all
  clc

  fe=8192; %La fréquence d’échantillonnage
  te=1/fe;
  ts=0:te:1;
   
    %La fréquence de chaque note de la gamme
  fdol=262;
  fRe=294;
  fMi=330;
  fFa=349;
  fSol=392;
  fLa=440;
  fSi=494;
  fDo2=523;
   
  DOl=sin(2*fdol*pi*ts);
  RE=sin(2*fRe*pi*ts);  
  MI=sin(2*fMi*pi*ts);
  FA=sin(2*fFa*pi*ts);
  SOL=sin(2*fSol*pi*ts);
  LA=sin(2*fLa*pi*ts);
  SI=sin(2*fSi*pi*ts); 
  DO2=sin(2*fDo2*pi*ts);
  lagamme=[DOl RE MI FA SOL LA SI DO2];
  
  sound (lagamme, fe ) ;
```
- **Synthèse d’une gamme de musique**

2- Utilisez l’outil graphique d’analyse de signaux signalAnalyzer pour visualiser le spectre de votre gamme. Observez les 8 fréquences contenues dans la gamme et vérifiez leur valeur numérique à l’aide des curseurs.

>la Gamme
<img width="999" alt="444" src="https://user-images.githubusercontent.com/89936910/210167555-2929b57a-ca8e-4ea6-abea-ee4cb3274974.png">
>le spectre
<img width="999" alt="11111" src="https://user-images.githubusercontent.com/89936910/210167557-632ad63b-30cf-4a26-a7ff-b351e5207dc7.png">

3- Tracez le spectrogramme qui permet de visualiser le contenu fréquentiel du signal au cours du temps (comme le fait une partition de musique) mais la précision sur l’axe des fréquences n’est pas suffisante pour relever précisément les 8 fréquences.

<img width="999" alt="Screenshot 2023-01-01 112326" src="https://user-images.githubusercontent.com/89936910/210167605-d2371732-8c7c-4b1c-a634-6d8194f3af0b.png">



- **Approximation du spectre d’un signal sinusoïdal à temps continu par FFT**

4- Le spectre d’un signal à temps continu peut être approché par transformée de Fourier discrète (TFD) ou sa version rapide (Fast Fourier Transform (FFT). Afficher le spectre de fréquence de la gamme musicale crée en échelle linéaire, puis avec une échelle en décibels.
```matlab
DS=abs(fft(gamme));
N=length(gamme)
subplot(2,1,1)
plot(DS);
title('Fft de la gamme');
k=mag2db(DS);
subplot(2,1,2)

%avec une échelle en décibels.
fshift=(-N/2:N/2 -1 )*fe/N;
plot(fshift,fftshift(k));
```
<img width="999" alt="k" src="https://user-images.githubusercontent.com/89936910/210167775-350cc715-563b-45f2-ad2f-38113c5add4a.png">

# 

-  **Réalisé par : Shadia AIT EL CADI** 
-  **Encadré par  : [Pr. AMMOUR Alae]**
