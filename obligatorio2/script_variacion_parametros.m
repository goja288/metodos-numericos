function script_variacion_parametros()

% prueba de como evoluciona el sistema variando los parametros iniciales
% usa el colormap hsv, This colormap begins with red, changes through yellow, green, cyan, blue, and magenta.

cant = 100;
iters = 400 ;
%cc=hsv(cant);
cc=hot(cant);
S = zeros(cant,iters);
I = zeros(cant,iters);
R = zeros(cant,iters);

for x = 1:(cant-1)
  s_0 = (cant - x) / cant;
  i_0 = 1 - s_0;
  [s,i,r] = SIREuler(4.3, 8.0, s_0, i_0, 0, 0.01, iters);
  S(x,:) = s;
  I(x,:) = i;
  R(x,:) = r;
  %[S(x,:),I(x,:),I(x,:)]  = [s, i, r];
  %plot(s, 'color',cc(x,:));
  %hold on;
end

%figure
for x = 1:(cant-1)
  plot (S(x,:), 'color',cc(x,:));
  hold on;
end
title('susceptibles')

figure
for x = 1:(cant-1)
  plot (I(x,:), 'color',cc(x,:));
  hold on;
end
title('infectados')

figure
for x = 1:(cant-1)
  plot (R(x,:), 'color',cc(x,:));
  hold on;
end
title('removidos')
