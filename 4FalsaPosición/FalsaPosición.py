import numpy as np
import sympy as sy
from sympy import *

def metodoPosicionFalsa(f, a, b, tol):
    return posicionFalsaAux(f, a, b, tol, 2)

def posicionFalsaAux(f, a, b, tol, iteraciones):

    x = sy.symbols('x')

    expr = sy.sympify(f)

    x_k = b - ((b - a)/(expr.evalf(subs={x:b}) - expr.evalf(subs={x:a})))*expr.evalf(subs={x:b})
    print(x_k)
    if (abs(x_k - b)/abs(x_k)) >= tol:
    
        if expr.evalf(subs={x:a})*expr.evalf(subs={x:x_k}) < 0:
            return posicionFalsaAux(f, a, x_k, tol, iteraciones + 1)
        elif expr.evalf(subs={x:x_k})*expr.evalf(subs={x:b}) < 0:
            return posicionFalsaAux(f, x_k, b, tol, iteraciones + 1)
    else:

        print ([x_k], iteraciones)
        return ([x_k], iteraciones)

metodoPosicionFalsa('cos(x) - x', 0.5, 0.78539816339, 0.001)
    
