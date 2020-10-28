import numpy as np
import math



def QR(A,tol):
    error = obtiene_Error(A)

    while error > tol:

        Q = obtiene_Q(A)
        QT = Q.transpose()
        R = np.dot(QT,A)

        A = np.dot(R,Q)

        error = obtiene_Error(A)
        
        
    autovalores = obtiene_D(A)
    
    return autovalores

def obtiene_D(A):
    contador = 0
    m = len(A)
    D = np.zeros([m,1])
    while contador != m:
        D[contador] = A[contador,contador]
        contador += 1
    return D


def obtiene_Error(A):
    contador_fila = 0
    m = len(A)
    contador_columna = 0
    error = 0
    while contador_columna != m:
        contador_fila = contador_columna + 1
        
        while contador_fila != m:
            error += abs(A[contador_fila,contador_columna])
            contador_fila += 1

        contador_columna += 1

    return error


def obtiene_Q(A):
    contador = 0
    m = len(A)
    Q = np.zeros([m,m])

    while contador != m:
        if contador == 0:
            U1 = A[:,contador]
            q1 = (1/np.linalg.norm(U1,2))*U1
            Q[:,contador] = q1
        else:
            U_k = A[:,contador] - suma(contador,A[:,contador],Q)
            q_k = (1/np.linalg.norm(U_k,2))*U_k
            Q[:,contador] = q_k
            
        contador += 1
    return Q   

def suma(k,A,Q):
    contador = 0
    resultado = 0
    while contador != k:
        resultado += vector(A,Q[:,contador])*Q[:,contador]
        contador += 1
    return resultado

def vector(x,y):
    contador = 0
    m = len(x)
    valor = 0
    while contador != m:
        valor += x[contador]*y[contador]
        contador += 1
    
    return valor




A = np.array([[3,1,0],[1,3,1],[0,1,3]])
print(QR(A,0.001))


             
