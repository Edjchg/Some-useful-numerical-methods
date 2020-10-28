function resultado = prueba(A)
  
  resultado = obtiene_A(A)
  
endfunction



function valor = obtiene_A(A)
  
  while A < 50
    A = A + 1
    
    if A == 25
      break
    endif
    
  endwhile
  
  valor = A
  return
  
  
  
  
endfunction
