function resultado = lagrange(f,vectorX,vectorY)
  pkg load symbolic
  syms x
  n = length(vectorX) + 1;
  indice = 1;
  resultado = 0;
  while indice != n
    resultado += vectorY(indice)*multiplicacionL(vectorX,indice,n);
    indice += 1;
  endwhile
  hold on;
  ezplot(f,[vectorX(1),vectorX(n-1)])
  ezplot(resultado,[vectorX(1),vectorX(n-1)])
  hold off;
  
  return
endfunction

function resultado = multiplicacionL(vectorX,indice,n)
  resultado = 1;
  contador = 1;
  syms x
  while contador != n
    if contador == indice
      contador +=1;
    else
      resultado = resultado*((x-vectorX(contador))/(vectorX(indice)-vectorX(contador)));
      contador += 1;
    endif
  endwhile
  return  
endfunction
vectorX = [-1,0,1,2]
vectorY = [-1,0,1,0]
f = 'sin((3.1415926554*x)/2)'
lagrange(f,vectorX,vectorY)