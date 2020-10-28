import numpy as np
import sympy as sy
from sympy import symbols

def trapecioCompuesto(f,a,b,cantidadPuntos):
    x = symbols('x')
    f = sy.sympify(f)
    
    h = (b-a)/(cantidadPuntos - 1)

    vectorX = creaVector(a,b,h,cantidadPuntos)

    resultado = (h/2)*suma(f,vectorX,cantidadPuntos)

    print(resultado)

    

def suma(f,vectorX,cantidadPuntos):
    x = symbols('x')
    f = sy.sympify(f)
    contador = 0
    resultado = 0
    while contador != cantidadPuntos - 1:
        resultado += f.evalf(subs={x:vectorX[contador]}) + f.evalf(subs={x:vectorX[contador + 1]})
        contador += 1
    return resultado

def creaVector(a,b,h,cantidadPuntos):
    xVector = []
    contador = 0
    nuevoValor = a
    while contador != cantidadPuntos:
        if contador == 0:
            xVector.append(nuevoValor)
            
        elif contador == cantidadPuntos - 1:
            xVector.append(b)

        else:
            nuevoValor = nuevoValor + h
            xVector.append(nuevoValor)
            
        contador += 1
    return xVector
trapecioCompuesto('ln(x)',2,5,4)
