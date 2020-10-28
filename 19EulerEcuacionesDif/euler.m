function [X Y] = euler(f,x_0,y_0,a,b,numeroPuntos)
  pkg load symbolic
  h = (b-a)/(numeroPuntos - 1);
  
  vectorX = obtenerVectorX(h,numeroPuntos,a,b);
  
  [X Y] = vectoresXY(f,x_0,y_0,h,vectorX)
  plot(X ,Y)
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

function [X Y] = vectoresXY(f,x_0,y_0,h,vectorX)
  syms x y;
  m = length(vectorX);
  contador = 1;
  
  Y = zeros(1,vectorX);
  Y(contador) = y_0;
  contador = 2;
  
  while contador != m + 1
    x = vectorX(contador - 1);
    y = Y(contador - 1);
    funcion = eval(f);
    Y(contador) = Y(contador-1) + h*(funcion);
    
    contador = contador + 1;
    
  endwhile
  X = vectorX;
  return
  
endfunction
