#Entradas:   f          -> función deseada por el usuario.
#           x_0,x_1,x_2 -> valor inicial para proceder con este método.
#           tol -> tolerancia que desee el usuario.
#           iteraciones ->cantidad deseada de iteraciones.

#Salidas: 
#         x_2 -> r      -> valor final de la posible solución de la ecuación.
function metodoMuller (f,x_0, x_1, x_2, tol, iteraciones)
  metodoMullerAux(f, x_0, x_1, x_2, tol, iteraciones,0)
  
endfunction

function [x_2, error] = metodoMullerAux(f, x_0, x_1, x_2, tol, iteraciones,contador)
  #evaluando la función f en los puntos x_0,x_1,x_2
  x = x_0
  fx_0 = eval(f)
  
  x = x_1
  fx_1 = eval(f)
  
  x = x_2
  fx_2 = eval(f)
  
  error = abs(fx_2)
  #Condición de parada
  if iteraciones == contador
    retval = [x_2, error]
    return
  else
    #Calculo de las constantes de la ecuación cuadrática que pasa por los tres puntos que se dan al inicio.
    c = fx_2
    b = (((x_0 - x_2)**(2))*(fx_1 - fx_2) - ((x_1 - x_2)**(2))*(fx_0 - fx_2))/((x_0 - x_1)*(x_0 - x_2)*(x_1 - x_2))
    a = (((x_1 - x_2)**(2))*(fx_0 - fx_2) - (x_0 - x_2)*(fx_1 - fx_2))/((x_0 - x_1)*(x_0 - x_2)*(x_1 - x_2))
    #Calculo del r.
    #(Nota: La función sgn es una función propia que calcula el sgn de un numero x)
    r = x_2 -((2*c)/(b + sgn(b)*sqrt((b**2)-4*a*c)))
    
    #Función propia que retorna cuales de las 3 equis es la más cercana al r que se acaba de calcular.

    nuevosX = calcula_x(x_0, x_1, x_2,r)
    
    #Llamada al mismo método(recursividad) con el nuevo x y repetir los pasos para obtener el mejor r.

    metodoMullerAux(f, nuevosX(1), nuevosX(2), nuevosX(3), tol, iteraciones, contador+1)
    
  endif
endfunction
#metodoMuller('sin(x) - x/2', 2, 2.2, 1.8, 0.0001, 2)




function n = sgn(x)
  if x > 0
    n = 1
  elseif x == 0
    n = 0
  elseif x < 0
    n = -1
  endif
  n
  return 
endfunction

function resultado = calcula_x(x_0, x_1, x_2, r)
  distancia_x0_r = abs(r - x_0)
  distancia_x1_r = abs(r - x_1)
  distancia_x2_r = abs(r - x_2)
  
  resultado = []
  vector = [distancia_x0_r distancia_x1_r distancia_x2_r]
  
  vectorOrdenado = sort(vector)
  
  vectorOrdenado(end) = []
  
  if ismember(distancia_x0_r,vectorOrdenado) == 1
    resultado = [resultado x_0]
  end
  
  if ismember(distancia_x1_r, vectorOrdenado) == 1
    resultado = [resultado x_1]
  endif
  
  if ismember(distancia_x2_r, vectorOrdenado) == 1
    resultado = [resultado x_2]
  endif
  
  resultado = [resultado r]
  return
  
 
endfunction

#metodoMuller('sin(x) - x/2', 2, 2.2, 1.8, 0.0001, 2)
#pkg load control
#a = [1 2 3]
#  a = [a 3] -> 1   2   3   3
#a(end) = [] -> 1 2 3

#bb = ismember(1,a) -> bb = 1 pues si hay 1 en a
