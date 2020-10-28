import numpy as np
import sympy as sy
from sympy import *


def biseccion(a,b,tol,f):
    return biseccion_aux(1,a,b,tol,f)

def biseccion_aux(iteracion,a,b,tol,f):
    
    xK = 0
    x = sy.symbols('x')
    expr = sy.sympify(f)
    
    print (expr)
    fevaluadoEnA = expr.evalf(subs={x:a})
    fevaluadoEnB = expr.evalf(subs={x:b})
    fevaluadoEnXk = expr.evalf(subs={x:xK})

    if fevaluadoEnA*fevaluadoEnB <= 0:
        xK = (a + b)/2

        if expr.evalf(subs={x:xK}) >= tol:
            print([xK,iteracion+1])
            return [xK, iteracion+1]
        
        elif fevaluadoEnA*fevaluadoEnXk <= 0:
            return biseccion_aux(iteracion+1,a,xK,tol,f)

        elif fevaluadoEnXk*fevaluadoEnB <= 0:
            return biseccion_aux(iteracion + 1,xK,b,tol,f)
        else:
            
            return [xK, 0]
    
biseccion(0,2,0.3,'2.71828182846^(x) - x -2')



    
