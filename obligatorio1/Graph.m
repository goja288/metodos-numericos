function Graph()

	addpath("matrices");
	load("matrices/harvard500.mat");
	HARV = G - diag(diag(G));
	load("matrices/wb-cs-stanford.mat");
	STANFORD = Problem.A - diag(diag(Problem.A)); 
	X = createMatrix(50);
	X = X - diag(diag(X)); 
	Y = createMatrix(500);
	Y = Y - diag(diag(Y));

	disp("POTENCIA vs ARNOLDI vs GAUSS-SEIDEL\n");
	#set(0, 'defaultfigurevisible', 'off');

	maxIteraciones = 20;
	tolerancia = 10^-20;
	alpha = 0.85;

	disp("################### X ########################\n\n");
	

	disp("PAGERANKPOW X: ");
	[autoVector,iter] = pagerankpow(X);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	sorted = sort(autoVector,"descend");
	bar(sorted(1:50));
	print('PageRank-GoldStandard-X','-dpng');

	

	disp("################### Y ########################\n\n");
	

	disp("PAGERANKPOW Y: ");
	[autoVector,iter] = pagerankpow(Y);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	sorted = sort(autoVector,"descend");
	bar(sorted(1:50));
	print('PageRank-GoldStandard-Y','-dpng');

	

	disp("################### HARVARD ########################\n\n");
	
	disp("PAGERANKPOW HARVARD: ");
	[autoVector,iter] = pagerankpow(HARV);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	sorted = sort(autoVector,"descend");
	bar(sorted(1:50));
	print('PageRank-GoldStandard-Harvard','-dpng');
	



	disp("################### STANFORD ########################\n\n");
	

	disp("PAGERANKPOW STANFORD: ");
	[autoVector,iter] = pagerankpow(STANFORD);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	sorted = sort(autoVector,"descend");
	bar(sorted(1:50));
	print('PageRank-GoldStandard-Stanford','-dpng');
	
	


endfunction

#crear matriz esparsa de dim*dim
function [A] = createMatrix(dim)
	A = sparse(dim,dim);
	maxnel = min(16,dim);
	for i = 1:dim
		nel = floor(rand(1)*maxnel);
		if(nel == 0)
			val = 0;
		else
			val = 1/nel;
		end
		for j = 1:nel
			col_ind = ceil(rand(1)*dim);
			while(A(col_ind,i) ~= 0)
				col_ind = ceil(rand(1)*dim);
			end
			A(col_ind,i) = val;
		end
	end
endfunction


