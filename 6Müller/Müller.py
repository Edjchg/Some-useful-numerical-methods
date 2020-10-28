import numpy as np
import sympy as sy
from sympy import *
import math import *

#Entradas:   f          -> función deseada por el usuario.
#           x_0,x_1,x_2 -> valor inicial para proceder con este método.
#           tol -> tolerancia que desee el usuario.
#           iteraciones ->cantidad deseada de iteraciones.

#Salidas: 
#         x_2 -> r      -> valor final de la posible solución de la ecuación.

def metodo_Muller(f, x_0, x_1, x_2, tol, iteraciones):

    metodo_MullerAux(f,x_0,x_1,x_2, tol, iteraciones, 0)

def metodo_MullerAux(f,x_0,x_1,x_2, tol, iteraciones, contador):
    x = sy.symbols('x')
    expr = sy.sympify(f)
    
    #evaluando la función f en los puntos x_0,x_1,x_2
    fx_0 = expr.evalf(subs={x:x_0})
    fx_1 = expr.evalf(subs={x:x_1})
    fx_2 = expr.evalf(subs={x:x_2})

    #Condición de parada
    if  iteraciones == contador or abs(fx_2) <= tol:
        print(x_2)
        return x_2
    else:
        #Calculo de las constantes de la ecuación cuadrática que pasa por los tres puntos que se dan al inicio.
        c = fx_2
        b = (((x_0 - x_2)**2)*(fx_1 - fx_2) - ((x_1 - x_2)**2)*(fx_0 - fx_2))/((x_0 - x_1)*(x_0 - x_2)*(x_1 - x_2))
        a = ((x_1 - x_2)*(fx_0 - fx_2) - (x_0 - x_2)*(fx_1 - fx_2))/((x_0 - x_1)*(x_0 - x_2)*(x_1 - x_2))

        #Calculo del r.
        #(Nota: La función sgn es una función propia que calcula el sgn de un numero x)
        r = x_2 - (2*c)/(b + sgn(b)*math.sqrt((b**2) - 4*a*c))

        
        #Función propia que retorna cuales de las 3 equis es la más cercana al r que se acaba de calcular.
        nuevosX = calcula_x(x_0,x_1,x_2,r)
        #Llamada al mismo método(recursividad) con el nuevo x y repetir los pasos para obtener el mejor r.
        metodo_MullerAux(f,nuevosX[0],nuevosX[1],nuevosX[2], tol,iteraciones, contador + 1)

def sgn(x):
    if x > 0:
        return 1
    elif x == 0:
        return 0
    elif x < 0:
        return -1

def calcula_x(x_0,x_1, x_2, r):
    distancia_x0_r = abs(r - x_0)
    distancia_x1_r = abs(r - x_1)
    distancia_x2_r = abs(r - x_2)
    vector = np.array([distancia_x0_r, distancia_x1_r, distancia_x2_r ])

    resultado = []
    
    vectorOrdenado = np.sort(vector, axis = 0)
    vectorOrdenado = vectorOrdenado[:-1]#Elimina el ultimo valor de este vector porque es el más grande.
    
    if distancia_x0_r in vectorOrdenado:
        resultado.append(x_0)
    if distancia_x1_r in vectorOrdenado:
        resultado.append(x_1)
    if distancia_x2_r in vectorOrdenado:
        resultado.append(x_2)

    resultado.append(r)  
    
    
    #print(vectorOrdenado)
    #print(resultado)
    return resultado
    #resultado = [x_0,x_2,r]
    

#calcula_x(2,2.2, 1.8, 1.895252107)  
metodo_Muller('sin(x) - x/2', 2, 2.2, 1.8, 0.0001, 2)   

