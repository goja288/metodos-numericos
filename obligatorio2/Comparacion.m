function Comparacion()
clf

disp("################### Caso A ########################\n\n");


[SeuCasoA,IeuCasoA,ReuCasoA] = SIREuler(0.5,0.0026,762,1,0,0.1,150);
%figure
plot(SeuCasoA,'r'); hold on;
plot(IeuCasoA,'g'); hold on;
plot(ReuCasoA,'b');
title('Euler Caso A')

[SpcCasoA,IpcCasoA,RpcCasoA] = SIRPC(0.5,0.0026,762,1,0,0.1,150);
figure
plot(SpcCasoA,'r'); hold on;
plot(IpcCasoA,'g'); hold on;
plot(RpcCasoA,'b');
title('PC Caso A')



disp("################### Caso B ########################\n\n");

[SeuCasoB,IeuCasoB,ReuCasoB] = SIREuler(2.82,0.0177,254,7,0,0.1,50);
figure
plot(SeuCasoB,'r'); hold on;
plot(IeuCasoB,'g'); hold on;
plot(ReuCasoB,'b');
title('Euler Caso B')

[SpcCasoB,IpcCasoB,RpcCasoB] = SIRPC(2.82,0.0177,254,7,0,0.1,50);
figure
plot(SpcCasoB,'r'); hold on;
plot(IpcCasoB,'g'); hold on;
plot(RpcCasoB,'b');
title('PC Caso B')
