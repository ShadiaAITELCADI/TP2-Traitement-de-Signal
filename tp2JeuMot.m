clear all 
close all
clc 


% [y,fs]=audioread("audio.opus");
% N = length(y)
% ts = 1/fs
% t = (0:N-1)*ts;
% plot(t,y)

%sound(y,fs)
% sound(y,fs*2)


%plot(fs*0.6,y)
%sound(y,fs*3)
% rien_ne_sert_de = y(5055:76000);
% plot(rien_ne_sert_de);
% title('Rien ne sert de');
% 
% rien_ne_sert_de = y(5055:76000);
% 
% courir  = y(76000:95395);
% 
% il_faut = y(95395:141652);
% 
% partir_a_point  = y(141652:198500);

%sound(rien_ne_sert_de,fs);
% sound(courir,fs);
% sound(il_faut,fs);
% sound(partir_a_point,fs);


% vector =[rien_ne_sert_de ; partir_a_point ; il_faut ; courir];
% sound(vector,fs);


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
%   Spectre de la gamme de musique
  gamme=[DOl RE MI FA SOL LA SI DO2];
  
  sound (gamme, fe ) ;
  
%   Approximation du spectre d’un signal sinusoïdal à temps continu par FFT
  DS=abs(fft(gamme));
  N=length(gamme)
  subplot(2,1,1)
  plot(DS);
  title('Fft de la gamme');
  k=mag2db(DS);
  subplot(2,1,2)

  fshift=(-N/2:N/2 -1 )*fe/N;
  plot(fshift,fftshift(k));
