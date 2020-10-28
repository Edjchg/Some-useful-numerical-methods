#Entradas:   f  -> funci�n deseada por el usuario.
#           x_o -> valor inicial para proceder con este m�todo.
#           tol -> tolerancia que desee el usuario.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         x_k         -> valor final de la posible soluci�n de la ecuaci�n.
#Para utilizar esta funci�n importar en command window:
#>>pkg load symbolic
#>>newton_raphson('2.71828182846^(x)-(1/x)', 0,1, 0.001, 0)

function [x_k, iteraciones] = newton_raphson(f,x_o,x_k,tol,iteraciones)
  error = 0
  syms x
  
  
  #deriva la funcion solicitada por el usuario.
  exprderivada = diff(f,x)
  expr2derivada = diff(exprderivada,x)
  
  x = x_o
  #Eval�a la funci�n primer derivada de la funcion original.
  exprderivada = eval(exprderivada)
  
  #Calculo de x_(k+1).
  x_k = x_o - (eval(f)/exprderivada)
  
  
  
  
  #Calculo del error y condici�n de parada.
  if((abs(x_k - x_o) / abs(x_k)) >= tol)
    newton_raphson(f, x_k, 0, tol, iteraciones + 1)
   else
    retval = [x_k, iteraciones]
    return
  endif
  
  
endfunction
