function resultado = runge_kutta2(f,x_0,y_0,a,b,numeroPuntos)
  pkg load symbolic
  h = (b-a)/(numeroPuntos - 1);
  vectorX = obtenerVectorX(h,numeroPuntos,a,b);
  [X Y] = vectoresXY(f,h,x_0,y_0,vectorX)
  plot(X,Y)
endfunction

function [X Y] = vectoresXY(f,h,x_0,y_0,vectorX)
  syms x y;
  m = length(vectorX);
  Y = zeros(1,m);
  
  contador = 1;
  x = vectorX(contador);
  Y(contador) = y_0;
  y = y_0;
  
  
  k1 = eval(f);
  
  x = vectorX(contador) + h/2;
  y = y_0 + h*(k1/2);
  
  k2 = eval(f);
  
  contador = 2;
  
  Y(contador) = y_0 + h*k2;
  while contador != m
    x = vectorX(contador);
    y = Y(contador);
    
    k1 = eval(f);
    
    x = vectorX(contador) + h/2;
    y = Y(contador) + h*(k1/2);
    
    k2 = eval(f);
    
    contador = contador + 1;
    
    Y(contador) = Y(contador - 1) + h*(k2);
  endwhile
  
  X = vectorX;
  return 
endfunction

function vectorX = obtenerVectorX(h,numeroPuntos,a,b)
  vectorX = zeros(1,numeroPuntos);
  contador = 1;
  while contador <= numeroPuntos
    if contador == 1
      vectorX(contador) = a;
      contador = contador + 1;
    elseif contador == numeroPuntos;
      vectorX(contador) = b;
      contador = contador + 1;
    else
      a = a+h;
      vectorX(contador) = a;
      contador = contador + 1; 
    endif
  
  endwhile
  return 
endfunction