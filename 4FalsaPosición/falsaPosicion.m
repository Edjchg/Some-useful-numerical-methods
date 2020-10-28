#Entradas:  interaciones -> cantidad de iteraciones que se ocupan para completar el metodo.
#          [a,b]-> intervalo deseado a calcular la funcion.
#           tol -> la tolerancia deseada.
#           f   -> la funcion en forma algebraica que se desea evaluar.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         x_k         -> valor final de la posible solución de la ecuación.
function [x_k, iteraciones] = falsaPosicion(f, a, b,tol, iteraciones)
  x = a
  
  exprA = eval(f)
  
  x = b
  
  exprB = eval(f)
  
  x_k = b - ((b - a)/(exprB - exprA))*exprB
  
  exprX_k = eval(f)
  
  if((abs(x_k - b) / abs(x_k)) >= tol)
    if(exprA*exprX_k < 0)
      falsaPosicion(f, a, x_k, tol, iteraciones)
    elseif(exprX_k*exprB < 0)
      falsaPosicion(f, x_k, b, tol, iteraciones +1)
    
      else
        retval = [x_k, iteraciones]
        return
      endif
     endif
  
endfunction

#Forma correcta de evaluar dicha funcion de secante:
#falsaPosicion('cos(x) - x', 0.5, 0.78539816339, 0.001, 2)