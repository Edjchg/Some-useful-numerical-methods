import numpy as np
import math


def gaussSeidel(A,b,x_0,tol,select):
    L = obtieneL(A)
    U = obtieneU(A)
    D = obtieneD(A)

    if select == 0:
        return gaussAtras(A,L,U,D,b,x_0,tol)
    else:
        return gaussAdelante(A,L,U,D,b,x_0,tol)

def gaussAdelante(A,L,U,D,b,x_0,tol):

    norma = b - np.dot(A,x_0)
    
    if np.linalg.norm(norma) < tol:
        return x_0
    else:
        
        inv_L_mas_D = np.linalg.inv(L + D)
        inv_L_mas_DU = np.dot(inv_L_mas_D,U)
        inv_L_mas_DUx0 = np.dot(inv_L_mas_DU,x_0)

        inv_L_mas_Db = np.dot(inv_L_mas_D,b)
        
        
        x_1 = -1*inv_L_mas_DUx0 + inv_L_mas_Db

        print(x_1)
        return gaussAdelante(A,L,U,D,b,x_1,tol)

def gaussAtras(A,L,U,D,b,x_0,tol):

    norma = b - np.dot(A,x_0)
    
    if np.linalg.norm(norma) < tol:
        return x_0
    else:

        inv_D_mas_U = np.linalg.inv(D + U)
        inv_D_mas_UL = np.dot(inv_D_mas_U,L)
        inv_D_mas_ULx0 = np.dot(inv_D_mas_UL,x_0)

        inv_D_mas_Ub = np.dot(inv_D_mas_U,b)
        x_1 = -1*inv_D_mas_ULx0 + inv_D_mas_Ub
        print(x_1)
        return gaussAtras(A,L,U,D,b,x_1,tol)
    
    

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

gaussSeidel(A,b,x_0,0.01,0)
