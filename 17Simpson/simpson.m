function resutlado = simpson(f,a,b)
  pkg load symbolic
  syms x
  h = (b-a)/2;
  
  x = a;
  fx0 = eval(f);
  x= (a+b)/2;
  fx1 = eval(f);
  
  x = b;
  
  fx2 = eval(f);
  
  resultado = (h/3)*(fx0 + 4*fx1 + fx2)
  return
endfunction
