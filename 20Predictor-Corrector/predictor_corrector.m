function resultado = predictor_corrector(f,x_0,y_0,a,b,numeroPuntos)
  h = (b-a)/(numeroPuntos - 1);
  vectorX = obtenerVectorX(h,numeroPuntos,a,b);
  [X Y] = vectoresXY(f,x_0,y_0,h,vectorX)
  plot(X,Y)
endfunction


function [ X Y] = vectoresXY(f,x_0,y_0,h,vectorX)
  pkg load symbolic
  syms x y;
  m = length(vectorX);
  contador = 1;
  
  Y_vargulilla = zeros(1,m);
  Y_vargulilla(contador) = y_0;
  
  Y_final = zeros(1,m);
  Y_final(contador) = y_0;
  contador = 2;
  
  while contador != m + 1
    %Valor predictor sacando euler:
    x = vectorX(contador - 1);
    y = Y_final(contador - 1);
    y_n = y;
    funcion = eval(f);
    Y_vargulilla(contador) = y_n + h*(funcion);
    %---------------------------------------------------------------
    %Valor predictor:
    
    
    
    
    x = vectorX(contador);
    y = Y_vargulilla(contador);
    funcion2 = eval(f);
    
    Y_final(contador) =  y_n + h*(funcion +  funcion2)/2 ;
    
    contador = contador + 1;
    
  endwhile
  X = vectorX;
  Y = Y_final
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

