import numpy as np
import sympy as sy
from sympy import symbols

def simpson(f,a,b):
    x = symbols('x')
    f = sy.sympify(f)
    h = (b-a)/2
    x1 = (a+b)/2

    fx0 = f.evalf(subs={x:a})
    fx1 = f.evalf(subs={x:x1})
    fx2 = f.evalf(subs={x:b})
    
    resultado = (h/3)*(fx0 + 4*fx1 + fx2)
    print(resultado)
    return resultado

simpson('ln(x)',2,5)
