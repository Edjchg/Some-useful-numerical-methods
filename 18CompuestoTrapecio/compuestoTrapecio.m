function resutlado = compuestoTrapecio(f,a,b,cantidadPuntos)
  pkg load symbolic
  syms x
  h = (b-a)/(cantidadPuntos - 1);
  vectorX = creaVector(a,b,h,cantidadPuntos);
  resultado = (h/2)*suma(f,vectorX,cantidadPuntos)
  return
endfunction

#compuestoTrapecio('e^(-x^2)',0,1,49)
function resultado = suma(f,vectorX,cantidadPuntos)
 
  syms x
  
  contador = 1;
  resultado = 0;
  while contador != cantidadPuntos
    
    x = vectorX(contador);
    
    valor1 = eval(f);
    
    x = vectorX(contador + 1);
    
    valor2 = eval(f);
    
    resultado = resultado + valor1 + valor2;
    contador = contador + 1;
    
  endwhile
  return
endfunction


function xVector = creaVector(a,b,h,cantidadPuntos)
  xVector = zeros(1,cantidadPuntos);
  contador = 1;
  nuevoValor = a;
  while contador != cantidadPuntos + 1
    if (contador == 1)
      xVector(contador) = nuevoValor;
    elseif (contador == cantidadPuntos)
      xVector(contador) = b;
    else
      nuevoValor = nuevoValor + h;
      xVector(contador) = nuevoValor;
    endif
    contador = contador + 1;
    
  endwhile
  return
endfunction
