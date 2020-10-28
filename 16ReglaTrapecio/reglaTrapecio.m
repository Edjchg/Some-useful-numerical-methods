function resutlado = reglaTrapecio(f,intervalo)
  syms x
  x = intervalo(1)
  fa = eval(f)
  x = intervalo(2)
  fb = eval(f)
  
  resultado = ((fa+fb)*(intervalo(2)-intervalo(1)))/2
  return  
  
endfunction
