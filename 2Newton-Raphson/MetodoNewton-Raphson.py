import numpy as np
import sympy as sy
from sympy import *

#Entradas:   f  -> función deseada por el usuario.
#           x_o -> valor inicial para proceder con este método.
#           tol -> tolerancia que desee el usuario.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         x_k         -> valor final de la posible solución de la ecuación.

def newton_raphson(f,x_o,tol):
    return newton_raphsonAux(f,x_o,0,tol,1)

def newton_raphsonAux(f,x_o,x_k,tol,iteraciones):
    error = 0
    x = sy.symbols('x')
    #Obtener la función solicitada por el usuario como una función utilizable
    #en Python.
    expr = sy.sympify(f)
    #Deriva la función anteriormente comentada.
    fderivada = expr.diff(x)

    #Calcula el x_(k+1), que en este caso se designa como x_k
    x_k = x_o - (expr.evalf(subs={x:x_o})/fderivada.evalf(subs={x:x_o}))

    #Calculo del error, así mismo como la consulta a la tolerancia designada.
    if (abs(x_k - x_o)/abs(x_k)) >= tol:
        return newton_raphsonAux(f, x_k, 0,tol, iteraciones + 1 )
    else:
        print([x_k, iteraciones])
        return [x_k, iteraciones]
        
newton_raphson('2.71828182846^(x)-(1/x)', 1,0.0001)
