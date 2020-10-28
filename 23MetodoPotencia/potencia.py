import numpy as np
import math

def potencia(A,x,iterMax):

    contador = 0

    while contador < iterMax:

        y_k = np.dot(A,x)
        lambda1 = np.linalg.norm(y_k,np.inf)#valor propio
        x = y_k/lambda1
        contador += 1

    resultado = [x, lambda1]

    print(x, 'vector propio')
    print(lambda1,'valor propio')
    return resultado
        
A = np.array([[1.5,0.5],[0.5,1.5]])
x = np.array([[0],[1]])
potencia(A,x,10)
