function Comparacion()


	disp("################### Caso A ########################\n\n");

	title('Euler Caso A')
	[SeuCasoA,IeuCasoA,ReuCasoA] = SIREuler(0.5,0.0026,762,1,0,0.1,150);
	title('PC Caso A')
	[SpcCasoA,IpcCasoA,RpcCasoA] = SIRPC(0.5,0.0026,762,1,0,0.1,150);




	disp("################### Caso B ########################\n\n");

	title('Euler Caso B')
	[SeuCasoB,IeuCasoB,ReuCasoB] = SIREuler(2.82,0.0177,254,7,0,0.1,50);
	title('PC Caso B')
	[SpcCasoB,IpcCasoB,RpcCasoB] = SIRPC(2.82,0.0177,254,7,0,0.1,50);
