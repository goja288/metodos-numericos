function A = ObtenerMatrizDeTransicion(G) 

vectorSumaColumnas = sum(G);
%vectorSinCeros = vectorSumaColumnas;
numeroColumnas = size(G,1);
numeroFilas = size(G,2);

%vectorSinCeros(vectorSinCeros == 0) = 1; % para poder dividir sustituyo los 0's

% A = G./vectorSinCeros; % ./ es division elemento a elemento

for j = 1:numeroColumnas
	%j
	if (vectorSumaColumnas(j) == 0) 
		A(:,j) = (linspace(1/numeroColumnas,1/numeroColumnas,numeroFilas)).'; 
	else
		A(:,j) = G(:,j) / vectorSumaColumnas(j); % no tiene 0 porque entra antes 
	end
		
end 




%vectorAuxiliar =  linspace(1/numeroColumnas,1/numeroColumnas,numeroFilas); % creo un vector auxiliar para despues sumarlo a la matriz

% Para cada columna que sea cero le sumo 1/N en cada entrada
%for i = find(vectorSumaColumnas == 0);
%	A(:,i) = vectorAuxiliar.';
%end

endfunction
