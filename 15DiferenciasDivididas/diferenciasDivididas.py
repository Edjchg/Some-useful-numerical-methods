import numpy as np
import sympy as sy
from sympy import symbols

def diferenciasDivididas(vectorX,vectorY):
    contador = 0
    n = len(vectorX)
   
    vectorDiferencias = difAux(vectorX,vectorY)

    resultado = 0

    while contador != n-1:
        resultado += vectorDiferencias[contador]*multiplicacion(contador,vectorX)

        contador += 1

    print(resultado)
    return resultado

def multiplicacion(indice,vectorX):

    n = len(vectorX)
    x = symbols('x')
    contador = 0
    resultado = 1

    while contador != indice:
        resultado = resultado*(x - vectorX[contador])
        contador += 1
        
    return resultado

def difAux(vectorX,vectorY):

    n = len(vectorX)-1
    contador = 0
    while contador != n:
        vectorY[contador + 1] = (vectorY[contador + 1] - vectorY[contador])/(vectorX[contador + 1] - vectorX[contador])
        contador += 1


    return vectorY

diferenciasDivididas([-2,0,1], [0,1,-1])
