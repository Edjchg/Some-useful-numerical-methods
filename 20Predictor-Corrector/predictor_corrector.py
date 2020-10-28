import numpy as np
import sympy as sy
from sympy import symbols
import matplotlib.pyplot as plt


def predictor_corrector(f,x_0,y_0,a,b,numeroPuntos):
    h = (b-a)/(numeroPuntos - 1)
    vectorX = obtenerVectorX(h,numeroPuntos,a,b)
    XY = vectoresXY (f,x_0,y_0,h,vectorX)
    print('x',XY[0])
    print('y',XY[1])
    plt.plot(XY[0],XY[1])
    plt.show()
def vectoresXY (f,x_0,y_0,h,vectorX):
    x,y = symbols('x y')
    f = sy.sympify(f)
    m = len(vectorX)
    contador = 0
    Y_vargulilla = np.zeros([m])
    Y_vargulilla[contador] = y_0

    Y_final = np.zeros([m])
    Y_final[contador] = y_0

    contador += 1

    while contador != m:
        #Valor predictor sacando euler:
        y_n = Y_final[contador - 1]

        funcion = f.evalf(subs={x:vectorX[contador - 1],y:Y_final[contador - 1]})

        Y_vargulilla[contador] = y_n + h*(funcion)
        #---------------------------------------------------------------------
        #Valor predictor:
        funcion2 = f.evalf(subs={x:vectorX[contador],y:Y_vargulilla[contador]})
        Y_final[contador] = y_n + h*(funcion + funcion2)/2
        contador += 1
   
    return [vectorX, Y_final]




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

def vectoresXY (f,x_0,y_0,h,vectorX):
    x,y = symbols('x y')
    f = sy.sympify(f)
    m = len(vectorX)
    contador = 0
    Y_vargulilla = np.zeros([m])
    Y_vargulilla[contador] = y_0

    Y_final = np.zeros([m])
    Y_final[contador] = y_0

    contador += 1

    while contador != m:
        #Valor predictor sacando euler:
        y_n = Y_final[contador - 1]

        funcion = f.evalf(subs={x:vectorX[contador - 1],y:Y_final[contador - 1]})

        Y_vargulilla[contador] = y_n + h*(funcion)
        #---------------------------------------------------------------------
        #Valor predictor:
        funcion2 = f.evalf(subs={x:vectorX[contador],y:Y_vargulilla[contador]})
        Y_final[contador] = y_n + h*(funcion + funcion2)/2
        contador += 1
   
    return [vectorX, Y_final]

predictor_corrector('y - x^2 + 1',0,0.5,0,2,11)



    
