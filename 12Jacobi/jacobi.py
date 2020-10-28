import numpy as np
import math


def jacobi(A,b,x_0,tol):
    L = obtieneL(A)
    D = obtieneD(A)
    U = obtieneU(A)
    jacobi_Aux(A,b,L,D,U,x_0,tol)


def jacobi_Aux(A,b,L,D,U,x_0,tol):
    norma = b - np.dot(A,x_0)
    if np.linalg.norm(norma) < tol:
        print(x_0)
        return x_0
    else:

        d_inv = np.linalg.inv(D)

        L_mas_U = L + U

        d_por_L_mas_U = np.dot(d_inv,L_mas_U)

        d_por_LUx0 = np.dot(d_por_L_mas_U,x_0)

        d_invB = np.dot(d_inv,b)
   
        x_1 =  -1*d_por_LUx0 + d_invB
        
        return jacobi_Aux(A,b,L,D,U,x_1,tol)
        
        
    return x_0


def obtieneL(A):
    m = len(A)
    L = np.zeros([m,m])
    contador = 0

    while contador != m:

        f = contador + 1

        while f != m:
            L[f][contador] = A[f][contador]

            f += 1

        contador += 1

    

    return L

def obtieneD(A):

    m = len(A)
    D = np.zeros([m,m])
    contador = 0

    while contador != m:

        D[contador][contador] = A[contador][contador]
        contador += 1
 
    return D
def obtieneU(A):

    m = len(A)
    U = np.zeros([m,m])
    contador = 0

    while contador != m:
        f = contador + 1
        while f != m:
            U[contador][f] = A[contador][f]

            f += 1
        contador += 1
   
    return U
    

A = np.array([[5,1,1], [1,5,1],[1,1,5]])
b = np.array([[7],[7],[7]])

x_0 = np.array([[0],[0],[0]])


jacobi(A,b,x_0,0.0001)


