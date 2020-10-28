#Entradas: -> Matriz de coeficientes A
#          -> Vector b
#Salidas:  ->Vector de soluciones del sistema de ecuaciones.

function vector = eliminacionGaussiana(A,bx)
  triangular = triangular_superior(A,bx)
  A = triangular(1)
  b = triangular(2)
  ix = length(A) -1
  nx = ix
  vectorX = zeros (nx+1)
  eliminacionGaussianaAux(A,bx,vectorX,ix,nx)
endfunction

function vectorX = eliminacionGaussianaAux(A,bx,vectorX,ix,nx)
  if ix < 0
    return
  if ix == nx
    vectorX(ix) = bx(ix)
  else
    vectorX(ix) = (1/(A(ix)(ix)))*((bx(ix)) - suma(ix,0,nx,A,bx,vectorX))
  endif
  eliminacionGaussianaAux(A,bx,vectorX,ix-1,nx)
  
endfunction


function resultado = suma(ix,jx,nx,A,b,vectorX)
  
  jx = ix +1
  while jx <= nx
    resultado = resultado + (A(ix)(jx))*vectorX(jx)
    jx = jx + 1
  endwhile
  
  return
endfunction

function matriz = triangular_superior(A,b)
  jx = 0
  
  while jx != length(A) - 1
    ix = jx + 1
    while ix != length(A)
      if (A(jx)(jx)) != 1
        equis0 = 1/(A(jx)(jx))
        b(jx) = b(jx)*equis0
      endif
      if A(ix)(jx) == 0
        ix = ix + 1
        continue
      else
        A(ix) = A(ix) + (-1)*(A(ix)(jx))*A(jx)
        b(ix) = b(ix) + (-1)*(A(ix)(jx))*b(jx)
      endif
      ix = ix + 1
    endwhile
    jx = jx + 1  
  endwhile
  if A(length(A)-1)(length(A)-1) != 1
    equis0 = 1/(A(length(A)-1)(length(A)-1))
    (A(length(A)-1)(length(A)-1) = (A(length(A)-1)(length(A)-1)*equis0
  endif
  
  matriz = [A,b]
  return
  
endfunction

