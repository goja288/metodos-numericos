% script Predictor-Corrector

[s,i,r] = SIREuler(4.3,8.0,.99,.01,0,0.01,400);

pcol1 = [255,0,0]/255; % red
pcol2 = [0,255,0]/255; % green
pcol3 = [0,0,255]/255; % blue

figure
title('Euler')
plot(s,'Color',pcol1); hold on;
plot(i,'Color',pcol2); hold on;
plot(r,'Color',pcol3);
