import numpy as np
import sympy as sy
from sympy import symbols


def integralReglaTrapecio(f,intervalo):

    x = symbols('x')
    f = sy.sympify(f)

    fa = f.subs(x,intervalo[0])
    fb = f.subs(x,intervalo[1])

    integral = ((fb+fa)*(intervalo[1]-intervalo[0]))/2
    print(float(integral))
    return integral

integralReglaTrapecio('sin(x)',[2,5])  

    
