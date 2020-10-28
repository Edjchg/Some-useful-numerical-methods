import numpy as np
import sympy as sy
from sympy import symbols
import matplotlib.pyplot as plt



def adams_bashforth3(f,x_0,y_0,a,b,numeroPuntos):
    h = (b-a)/(numeroPuntos - 1)
    vectorX = obtenerVectorX(h,numeroPuntos,a,b)
    XY = euler(f,x_0,y_0,a,b,numeroPuntos)
    Y_1 = XY[1]
    Y_2 = XY[2]
    XY = adams_bashforth3_aux(f,vectorX,h,x_0,y_0,Y_1,Y_2)
    print('x',XY[0])
    print('y',XY[1])
    plt.plot(XY[0],XY[1])
    plt.show()
def adams_bashforth3_aux(f,vectorX,h,x_0,y_0,Y_1,Y_2):
    f = sy.sympify(f)
    x,y = symbols('x y')
    contador = 0
    m = len(vectorX)
    Y = np.zeros([m])
    Y[contador] = y_0
    Y[contador + 1] = Y_1
    Y[contador + 2] = Y_2
    x_n = vectorX[contador]
    y_n = Y_1
    funcion2 = f.evalf(subs={x:x_n,y:y_0})
    contador += 1
    x_n = vectorX[contador]
    y_n = Y[contador]
    funcion1 = f.evalf(subs={x:x_n,y:y_0})
    contador += 1
    x_n = vectorX[contador]
    y_n = Y[contador]
    funcion0 = f.evalf(subs={x:x_n,y:y_0})
    Y[contador + 1] = Y[contador] + (h/16)*(23*funcion0 - 16*funcion1 + 5*funcion2)
    contador += 1
    while contador != m:
        x_n = vectorX[contador - 1]
        y_n = Y[contador-1]
        funcion2 = f.evalf(subs={x:x_n,y:y_0})
        x_n = vectorX[contador - 2]
        y_n = Y[contador - 2]
        funcion1 = f.evalf(subs={x:x_n,y:y_0})
        x_n = vectorX[contador - 3]
        y_n = Y[contador - 3]
        funcion0 = f.evalf(subs={x:x_n,y:y_0})
        Y[contador] = Y[contador - 1] +(h/16)*(23*funcion2 - 16*funcion1+ 5*funcion0)
        contador += 1
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


def euler (f,x_0,y_0,a,b,numeroPuntos):
    h = (b-a)/(numeroPuntos - 1)

    vectorX = obtenerVectorX(h,numeroPuntos,a,b)
    
    XY = vectoresXY(f,x_0,y_0,h,vectorX)
    return XY[1]
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

adams_bashforth3('-x*y + 4*x/y',0,1,0,1,11)
