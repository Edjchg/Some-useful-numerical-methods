function resultado = adams_bashforth3(f,x_0,y_0,a,b,numeroPuntos)
  h = (b - a)/(numeroPuntos - 1);
  vectorX = obtenerVectorX(h,numeroPuntos,a,b);
  [X Y] = euler(f,x_0,y_0,a,b,numeroPuntos);
  Y_1 = Y(2);
  Y_2 = Y(3);
  [X Y] = adams_bashforth3_aux(f,vectorX,h,x_0,y_0,Y_1,Y_2);
  plot(X,Y)
endfunction
function [X Y] = adams_bashforth3_aux(f,vectorX,h,x_0,y_0,Y_1,Y_2)
  syms x y
  m = length(vectorX);
  Y = zeros(1,m);
  contador = 1;
  Y(contador) = y_0;
  Y(contador + 1) = Y_1;
  Y(contador + 2) = Y_2;
  x = vectorX(contador);
  y = Y_1;
  funcion2 = eval(f);
  contador = contador + 1;
  x = vectorX(contador);
  y = Y(contador);
  funcion1 = eval(f);
  contador = contador + 1;
  x = vectorX(contador);
  y = Y(contador);
  funcion0 = eval(f);
  Y(contador + 1) = Y(contador) + (h/16)*(23*funcion0 - 16*funcion1 + 5*funcion2);
  contador = contador + 1;
  while contador != m
    x = vectorX(contador - 1);
    y = Y(contador - 1);
    funcion2 = eval(f);
    x = vectorX(contador - 2);
    y = Y(contador - 2);
    funcion1 = eval(f);
    x = vectorX(contador - 3);
    y = Y(contador - 3);
    funcion0 = eval(f);
    Y(contador) = Y(contador - 1) + (h/16)*(23*funcion2 - 16*funcion1 + 5* funcion0);
    contador = contador + 1;
  endwhile
  X = vectorX;
  return
endfunction

function [X Y] = euler(f,x_0,y_0,a,b,numeroPuntos)
  pkg load symbolic
  h = (b-a)/(numeroPuntos - 1);
  
  vectorX = obtenerVectorX(h,numeroPuntos,a,b);
  
  [X Y] = vectoresXY(f,x_0,y_0,h,vectorX)
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