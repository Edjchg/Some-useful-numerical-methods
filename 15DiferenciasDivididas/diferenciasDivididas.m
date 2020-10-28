function resultado = diferenciasDivididas(vectorX,vectorY)
  pkg load symbolic
  
  syms x
  contador = 1;
  n = length(vectorX);
  
  vectorDiferencias = diferenciasAux(vectorX,vectorY);
  resultado = 0;
  while contador != n + 1
       
       resultado += vectorDiferencias(contador)*multiplicacion(contador,vectorX);
      
      
       contador = contador + 1;
    
  endwhile
  
  return
  
  
endfunction


function resultado = multiplicacion(indice, vectorX)
  n = length(vectorX);
  syms x
  contador = 1;
  resultado = 1;
  while contador != indice 
    
    resultado = resultado*(x - vectorX(contador));
    contador = contador + 1;
  endwhile
  
  return 
  
endfunction

function y = diferenciasAux(vectorX,vectorY)
  n = length(vectorX);
  for k = 1:n-1
    vectorY(k+1:n)= (vectorY(k+1:n)-vectorY(k:n-1))./(vectorX(k+1:n)-vectorX(1:n-k))
  endfor
  y = vectorY;
  return
endfunction
