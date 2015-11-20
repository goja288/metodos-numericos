% script Predictor-Corrector

[s,i,r] = SIRPC(4.3,8.0,.99,.01,0,0.01,400);

pcol1 = [255,0,0]/255; % red
pcol2 = [0,255,0]/255; % red
pcol3 = [0,0,255]/255; % red

figure
plot(s,'Color',pcol1); hold on;
plot(i,'Color',pcol2); hold on;
plot(r,'Color',pcol3);
title('Predictor-Corrector')
