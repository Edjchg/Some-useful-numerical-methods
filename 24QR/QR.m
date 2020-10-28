
function autovalores = QR(A,tol)
  #valor = vector(x,y)
  
  error = obtiene_error(A);
  while error > tol
    
    Q = obtiene_Q(A);
    QT = Q';
    R = QT*A;
    
    A = R*Q;
    
    error = obtiene_error(A);
    
  endwhile
  autovalores = obtiene_D(A);
  
  return
  
endfunction


function D = obtiene_D(A)
  contador = 1;
  m = length(A);
  D = zeros(m,1);
  while contador != m + 1
    D(contador,1) = A(contador,contador);
    contador = contador + 1;
  endwhile
  return
endfunction



function error = obtiene_error(A)
  contador_fila = 1; 
  m = length(A);
  error = 0;
  contador_columna = 1;
  
  while contador_columna != m + 1
    contador_fila = contador_columna + 1;
    while contador_fila != m + 1;
      error = error + abs(A(contador_fila,contador_columna));
      contador_fila = contador_fila + 1;
    endwhile
    contador_columna = contador_columna + 1;
  endwhile
  
  return
  
endfunction

function Q = obtiene_Q(A)
  contador = 1;
  m = length(A);
  Q = zeros(m,m);
  
  while contador != m + 1
    if contador == 1
      U1 = A(:,contador);#-> obtiene una columna especifica
      q1 = (1/norm(U1,2))*U1;
      Q(:,contador) = q1;
      #contador = contador + 1;
      
    else
      U_k = A(:,contador) - suma(contador,A(:,contador),Q);
      q_k = (1/norm(U_k,2))*U_k;
      Q(:,contador) = q_k;
      #contador = contador + 1;
    endif
    
    contador = contador + 1;

  endwhile
  
  return
endfunction


function resultado = suma(k,A,Q)
  
  contador = 1;
  resultado = 0;
  while contador != k 
    
    resultado = resultado + vector(A,Q(:,contador))*Q(:,contador);
    contador = contador + 1;
  endwhile
  return
endfunction



function valor = vector(x,y)
  contador = 1;
  m = length(x);
  valor = 0;
  while contador  != m + 1
    valor = valor + x(contador)*y(contador);
    contador = contador + 1;
  endwhile
  return
endfunction

#A =

#  -1   3
#   1   5