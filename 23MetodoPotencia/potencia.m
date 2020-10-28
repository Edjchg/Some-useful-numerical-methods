function [x lambda] = potencia(A,x,iterMax)
  contador = 0;
  while contador < iterMax
    
    y_k = A*x;
    lambda = norm(y_k,inf);#Valor propio
    x = y_k/lambda; #Vector propio
    contador = contador + 1;
    
  endwhile
  
  return 
  
  
endfunction
