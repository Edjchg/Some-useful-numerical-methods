##1-> L, -> L*L^Tx = b -> Ly=b, y=[], ->conociendo y L^Tx = y, x = []
#Entradas: -> Matriz de coeficientes A
#          -> Vector b
#Salidas:  ->Vector de soluciones del sistema de ecuaciones.
function x = factorizacion_Cholesky(A,b)
  n = length(A)
  L = Linterior(A,1,1)
  vectorX = zeros(1,n)
  y = Lyb(L,b,0,vectorX)
  L = L'
  
  i = length(L)-1
  n =i
  x = LTxy(L,y,i,vectorX,n)
  
  return
  
endfunction


function vectorX = LTxy(LT,y,i,vectorX,n)
  
  if i < 1
    return
  endif
  
  if i == n
    vectorX(i) = y(i)/LT(i,i)
  else
    vectorX(i) = (1/LT(i,i))*(y(i) - suma_hacia_atras(i,1,n,LT,y,vectorX))
  endif
  
  LTxy(LT,y,i-1,vectorX,n)
  
endfunction


function resultado =  suma_hacia_atras(ix,jx,nx,A,b,vectorX)
  jx = ix +1
  
  while jx < nx
    
    resultado = resultado + (A(ix,jx))*vectorX(jx)
    jx = jx + 1

  endwhile

  return

endfunction


function vectorX = Lyb(L,b,i,vectorX)
  
  if i > length(b)-1
    return
  endif
  
  if == 1
    vectorX(i) = b(i)/L(i,i)
  else
    vectorX(i) = (1/L(i,i))*(b(i) - suma_hacia_adelante(i,1,L,b,vectorX))
  endif
  Lyb(L,b,i+1,vectorX)
  
endfunction


function resultado = suma_hacia_adelante(i,j,A,b,vectorX)
  
  j = i-1
  
  while j >= 1
    resultado = resultado + (A(i,i)*vectorX(j))
    j = j-1
    
  endwhile
  
  return
endfunction

function L = Linferior(A,i,j)
  m = length(A)
  L = zeros(m,m)
  
  for j = 1:m
    i = j
    while i <= m-1
      if i == j
        L(j,j) = sqrt(A(j,j) - sumaJJ(L,j-1,j,1))
      else
        L(i,j) = (1/L(j,j))*(A(i,j) - sumaIKJK(L,j-1,j,1,i))
      endif
      
      i = i+1
      
    endwhile
  endfor
  
  return
  
endfunction


function resultado = sumaJJ(L,n,j,k)
  
  while k <= n
    
    resultado = resultado + L(j,k)**2
    
    k = k +1
    
  endwhile
  
  return
endfunction



function resultado = sumaIKJK(L,n,j,k,i)
  while k <= n
    resultado = resultado + L(i,k)*L(j,k)
    k = k + 1
    
  endwhile
  
  return
endfunction
































































































