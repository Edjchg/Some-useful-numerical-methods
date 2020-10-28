#Entradas: -> Matriz de coeficientes A
#          -> Vector b
#Salidas:  ->Vector de soluciones del sistema de ecuaciones.

function x = factorizacion_LU(A,b)
  matriz = triangularLU(A)
  
  #matrizL = matriz(1)
  #n = length(matrizL)
  
  #vectorX = zeros(n)
  
  #y = Lyb(matrizL,b,1,vectorX)
  
  #matrizU = matriz(2)
  
  #i = length(matrizU)-1
  
  #n = i
  
  #x = Uxy(matrizU,y,i,vectorX,n)
  #x = matriz
  return  
endfunction






function vector = Uxy(U,LYb,i,vectorX,n)
  if i < 1
    return
  endif
  
  if i == 1
    vectorX(i) = LYb(i)/U(i,i)
  else
    vectorX(i) = (1/U(i)(i))*((LYb(i)) - suma_hacia_atras(i,0,n,U,LYb,vectorX))
    Uxy(U,LYb,i-1,vectorX,n)
  endif
  
endfunction



function resultado = suma_hacia_atras(ix,jx,nx,A,b,vectorX)
  jx = jx + 1
  
  while jx <= nx
    resultado = resultado + (A(ix)(jx))*vectorX(jx)
    jx = jx + 1    
    
  endwhile
  return
endfunction




function vector = Lyb(L,b,i,vectorX)
  if i > length(L)-1
    vector = vectorX
    return
    
  endif
  
  if i == 0
    vectorX(i) = b(i)/L(i,i)
  else
    vectorX(i) = (1/L(i,i))*((b(i)) - suma_hacia_adelante(i,1,n,L,vectorX))
  endif
  
  Lyb(L,b,i+1,vectorX)
  
endfunction

function resultado = suma_hacia_adelante(i,j,n,A,b,vectorX)
  
  j = i-1
  
  while j >= 0
    
    resultado = resultado + (A(i)(j))*vectorX(j)
    j = j-1
    
  endwhile
  
  return
  
endfunction


function resultado = triangularLU(A)
  m = length(A)
  L = zeros(m,m)
  U = zeros(m,m)
  
  for r = 1 :1:m
    for c = 1:m
      U(r,c) = A(r,c)
    endfor
  endfor
  
  for k = 1:m
    for r = 1:m
      if k == r
        L(k,r) = 1
      endif
      if k < r
        factor = (A(r,c))/(A(k,k))
        L(r,k) = factor
        
        for c = 1:m
          A(r,c) = A(r,c) - (factor*A(k,c))
          U(r,c) = A(r,c)
        endfor
      endif
    endfor
  endfor
  
  [L U ] = resultado
  return
  
endfunction









































