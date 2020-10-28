import numpy as np
import sympy as sy
from sympy import symbols
import matplotlib.pyplot as plt

def runge_kutta2(f,x_0,y_0,a,b,numeroPuntos):
    h = (b-a)/(numeroPuntos - 1)
    vectorX = obtenerVectorX(h,numeroPuntos,a,b)
    XY = vectoresXY(f,h,x_0,y_0,vectorX)
    print('x',XY[0])
    print('y',XY[1])
    plt.plot(XY[0],XY[1])
    plt.show()
def vectoresXY(f,h,x_0,y_0,vectorX):
    x,y = symbols('x y')
    f = sy.sympify(f)
    m = len(vectorX)
    Y = np.zeros([m])
    contador = 0
    Y[contador] = y_0
    k1 = f.evalf(subs={x:vectorX[contador],y:y_0})
    x_n = vectorX[contador] + h/2
    y_n = y_0 + h*(k1/2)
    k2 = f.evalf(subs={x:x_n,y:y_n})
    contador += 1
    Y[contador] = y_0 + h*k2
    while contador != m-1:
        x_n = vectorX[contador]
        y_n = Y[contador]

        k1 = f.evalf(subs={x:x_n,y:y_n})

        x_n = vectorX[contador] + h/2
        y_n = Y[contador] + h*(k1/2)

        k2 = f.evalf(subs={x:x_n,y:y_n})

        contador += 1

        Y[contador] = Y[contador - 1] + h*k2
        
  
    return [vectorX, Y]

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


runge_kutta2('-x*y + 4*x/y',0,1,0,1,11)
