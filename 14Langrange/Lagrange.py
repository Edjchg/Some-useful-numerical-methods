import numpy as np
import sympy as sy
from sympy import symbols,plot


def lagrange(f,vectorX,vectorY):
    f = sy.sympify(f)
    indice = 0
    n = len(vectorX)
    resultado = 0
    x = symbols('x')
    while indice != n:
        resultado += vectorY[indice]*multiplicacionL(vectorX,indice,n)
        indice += 1
    print(resultado)
    resultado = sy.sympify(resultado)
    p1 = plot(resultado,(x,vectorX[0],vectorX[n-1]),show=False,line_color = 'r')
    p2 = plot(f,(x,vectorX[0],vectorX[n-1]),show=False)
    p1.append(p2[0])
    p1.show()
    return resultado

def multiplicacionL(vectorX,indice,n):
    resultado = 1
    contador = 0
    x = symbols('x')
    while contador != n:
        if contador == indice:
            contador += 1
        else:
            
            resultado = resultado*((x-vectorX[contador])/(vectorX[indice]-vectorX[contador]))
            contador += 1
##    print(resultado)
    return resultado
lagrange('sin((3.1415926554*x)/2)',[-1,0,1,2],[-1,0,1,0])

    
