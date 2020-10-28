function resultado1 = jacobi(A,b,x_0,tol)
  L = obtiene_L(A)
  U = obtiene_U(A)
  D = obtiene_D(A)
  
  resultado1 = jacobiAux(A,L,U,D,b,x_0,tol)
  
  return
  
  
endfunction

function resultado = jacobiAux(A,L,U,D,b,x_0,tol)
  
  if norm(b-A*x_0) < tol
    resultado = x_0
    return
  else
    x_1 = -inv(D)*(L + U)*x_0 + inv(D)*b
    jacobiAux(A,L,U,D,b,x_1,tol)
  endif
  
endfunction

function D = obtiene_D(A)
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
