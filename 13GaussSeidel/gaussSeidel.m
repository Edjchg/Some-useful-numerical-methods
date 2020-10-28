function resultado = gaussSeidel(A,b,x_0,tol,select)
  L = obtiene_L(A)
  U = obtiene_U(A)
  D = obtiene_D(A)
  
  if select == 0
    reultado = gaussAtras(A,L,U,D,b,x_0,tol)
  else
    resultado = gaussAdelante(A,L,U,D,b,x_0,tol)
  endif
  
endfunction

function atras = gaussAtras(A,L,U,D,b,x_0,tol)
  if norm(b-A*x_0) < tol
    atras = x_0
    return
  else
    x_1 = -inv(D + U)*L*x_0 + inv(D + U)*b
    gaussAtras(A,L,U,D,b,x_1,tol)
  endif
  
endfunction


function adelante = gaussAdelante(A,L,U,D,b,x_0,tol)
  if norm(b-A*x_0) < tol
    adelante = x_0
    return
  else
    x_1 = -inv(L + D)*U*x_0 + inv(L + D)*b
    gaussAdelante(A,L,U,D,b,x_1,tol)
  endif
  
endfunction



function D = obtiene_D(A,L,D,U,x)
  m = length(A) 
  D = zeros(m,m)
  
  m = m + 1
  i = 1 
  while i!= m
    
    D(i,i) = A(i,i)
    
    i = i + 1
  endwhile
  
  return
  
endfunction

function U = obtiene_U(A)
  m = length(A)
  U = zeros(m,m)
  m = m + 1
  f = 1
  while f != m
    c = f + 1
    while c != m
      U(f,c) = A(f,c)
      c = c + 1
    endwhile
  f = f + 1
  endwhile
  
  return
  
endfunction


function L = obtiene_L(A)
  m = length(A)
  L = zeros(m,m)
  m = m + 1
  
  c = 1
  while c != m
    f = c + 1
    while f != m
      L(f,c) = A(f,c)
      f = f + 1      
      
    endwhile
    
    c = c + 1
    
  endwhile
  
  return
  
  
endfunction

