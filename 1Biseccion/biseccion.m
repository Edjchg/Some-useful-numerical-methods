#Entradas:  interaciones -> cantidad de iteraciones que se ocupan para completar el metodo.
#          [a,b]-> intervalo deseado a calcular la funcion.
#           tol -> la tolerancia deseada.
#           f   -> la funcion en forma algebraica que se desea evaluar.
function [x_k, iteraciones] = biseccion(iteraciones, a, b, tol,f)
  x_k = 0
  
  
  #funcion puesta por el usuario evaluada en: f(a),f(b),f(xK).
  x = a
  exprA = eval(f)
  
  x = b 
  exprB = eval(f)
  
  x = x_k
  exprX = eval(f)
  
  retval =[]
  #Evaluación del teorema de Bolzano.
  if(exprA*exprB <= 0)
    #Calculo de xK
    x_k = (a+b)/2
    #Evaluación de la condición de parada!
    if (exprX > tol)
      retval =  [x_k, iteraciones]
      return;
    #Evaluación del teorema de Bolzano, para el primer subintervalo.
    elseif (exprA*exprX <= 0)
       biseccion(iteraciones+1, a, x_k,f)
    #Evaluación del teorema de Bolzano, para el segundo subintervalo.
    elseif (exprX*exprB <= 0)
       biseccion(iteraciones+1, x_k,b, tol, f)
     else
      retval = [x_k, 0]
      return;
     endif
  endif
  
endfunction 

#Forma de evaluar correctamente el método:si que desea poner pi o e,
#es necesario poner una aproximación de estos números.
#biseccion(1,0,2,0.3,'2.71828182846^(x) - x -2')