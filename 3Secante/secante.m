
#Entradas:   f  -> función deseada por el usuario.
#           x_o -> valor inicial para proceder con este método.
#           x_1 -> valor inicial para proceder con este método.
#           tol -> tolerancia que desee el usuario.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         x_k         -> valor final de la posible solución de la ecuación.

function [x_k, iteraciones] = secante(f, x_0, x_1,tol, iteraciones)
  x = x_0
  
  exprX_0 = eval(f)
  
  x = x_1
  
  exprX_1 = eval(f)
  #Calculo de x_(k+1).
  x_k = x_1 - ((x_1 - x_0)/(exprX_1 - exprX_0))*exprX_1
  
  printf("%d x_k\n", x_k)
  
  #Calculo del error y condición de parada.
  if((abs(x_k - x_1) / abs(x_k)) >= tol)
    secante(f, x_1, x_k, tol, iteraciones + 1)
   else
    retval = [x_k, iteraciones]
    return
  endif 
endfunction


#Forma correcta de evaluar dicha funcion de secante:
#secante('x^3 + 2*x^2 + 10*x - 20', 0, 1, 0.0009, 2)