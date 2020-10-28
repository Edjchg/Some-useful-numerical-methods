import numpy as np
import sympy as sy
from sympy import symbols
import matplotlib.pyplot as plt

def euler (f,x_0,y_0,a,b,numeroPuntos):
    h = (b-a)/(numeroPuntos - 1)

    vectorX = obtenerVectorX(h,numeroPuntos,a,b)
    
    XY = vectoresXY(f,x_0,y_0,h,vectorX)
    print('x',XY[0])
    print('y',XY[1])
    plt.plot(XY[0],XY[1])
    plt.show()
def obtenerVectorX(h,numeroPuntos,a,b):
    vectorX = np.zeros([numeroPuntos])
    contador = 0

    while contador <= numeroPuntos-1:
        if contador == 0:
            vectorX[contador] = a
            contador += 1
        elif contador == numeroPuntos:
            vectorX[contador] = b
            contador += 1
        else:
            a = a + h
            vectorX[contador] = a
            contador += 1
    
    return vectorX
    


def vectoresXY(f,x_0,y_0,h,vectorX):
    x,y = symbols('x y')
    contador = 0
    m = len(vectorX)
    Y = np.zeros([m])
    
    Y[contador] = y_0
    f = sy.sympify(f)
    contador += 1
    while contador != m:
        
        funcion = f.evalf(subs={x:vectorX[contador-1],y:Y[contador - 1]})

        Y[contador] = Y[contador - 1] + h*(funcion)

        contador += 1
    
    return [vectorX, Y]



euler('y - x^2 + 1',0,0.5,0,2,11)
