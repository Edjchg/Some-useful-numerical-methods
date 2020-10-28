import numpy as np
import sympy as sy
from sympy import *

#Entradas:   f  -> función deseada por el usuario.
#           x_o -> valor inicial para proceder con este método.
#           x_1 -> valor inicial para proceder con este método.
#           tol -> tolerancia que desee el usuario.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         x_k         -> valor final de la posible solución de la ecuación.

def metodoSecante(f, x_0, x_1,tol):
    f
    return metodoSecanteAux(f, x_0, x_1, tol, 2)

def metodoSecanteAux(f, x_0, x_1, tol, iteraciones):
    error = 0
    x = sy.symbols('x')
    #Obtener la función solicitada por el usuario como una función utilizable
    #en Python.
    expr = sy.sympify(f)


    #Calcula el x_(k+1)
    x_k = x_1 - ((x_1 - x_0)/(expr.evalf(subs={x:x_1}) - expr.evalf(subs={x:x_0})))*expr.evalf(subs={x:x_1})
    print (x_k)

    #calculo del eror absoluto, a su vez este es comparado con la tolerancia.
    if (abs(x_k - x_1)/abs(x_k)) >= tol:
        
        return metodoSecanteAux(f, x_1, x_k, tol, iteraciones +1)
    else:
        print ([x_k], iteraciones)
        return ([x_k], iteraciones)


metodoSecante('x^3 + 2*x^2 + 10*x - 20', 0, 1,0.0009)
