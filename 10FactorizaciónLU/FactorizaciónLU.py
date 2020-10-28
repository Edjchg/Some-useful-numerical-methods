import numpy as np
#Entradas: -> Matriz de coeficientes A
#          -> Vector b
#Salidas:  ->Vector de soluciones del sistema de ecuaciones.

def factorizacion_LU(A,b):
    #Sacando matriz L y U
    matriz = triangularLU(A)

    #Matriz L
    matrizL = matriz[0]

    #Largo de la matriz L
    n = len(matrizL)
    print(n)

    #Generando un vector de resultados con 0 [0,0,...0]
    vectorX = np.zeros(n)

    #Sacando el vector de soluciones para Y, segun la formula Ly = b
    y = Lyb(matrizL,b,0,vectorX)

    #Sacando la matriz U
    matrizU = matriz[1]

    i = len(matrizU)-1

    n = i

    #Sacando el vector de soluciones para X, segun la formula Ux = y
    x = Uxy(matrizU,y,i,vectorX,n)

    print(x)
    return x




#i = len(U)-1
def Uxy(U,LYb,i,vectorX,n):

    if i < 0:
        print(vectorX)
        return vectorX
    if i == n:
        vectorX[i] = LYb[i]/U[i][i]
        
    else:
        
        
        vectorX[i] = (1/(U[i][i]))*((LYb[i])-suma_hacia_atras(i,0,n,U,LYb,vectorX))
    return Uxy(U,LYb,i-1,vectorX,n)



def suma_hacia_atras(ix,jx,nx,A,b,vectorX):
    resultado = 0
    jx = ix + 1
  
    while jx <= nx:
        resultado += (A[ix][jx])*vectorX[jx]
        jx += 1
    return resultado

#i = 0
def Lyb (L,b,i,vectorX):
    
    resultado_vector_Y = []
    if i > len(L)-1:
        print(vectorX)
        return vectorX
    if i==0:
        vectorX[i] = b[i]/L[i][i]
        
    
    else:
        vectorX[i] = (1/(L[i][i]))*((b[i])-suma_hacia_adelante(i,0,n,L,b,vectorX))

    return Lyb(L,b,i+1,vectorX)

def suma_hacia_adelante(i,j,n,A,b,vecotorX):
    resultado = 0
    j = i - 1
    while j >= 0:
        resultado += (A[i][j]*vectorX[j])
        j -= 1
    return resultado

#De la matriz A obtiene la matriz L y U
def triangularLU(A):
    
    m = len(A)
    L = np.zeros([m,m])
    U = np.zeros([m,m])

    for r in range(0,m):
        for c in range(0,m):
            U[r,c] = A[r,c]
    
    
    for k in range(0,m):
        for r in range(0,m):
            if (k==r):
                L[k,r] = 1
            if (k<r):
                factor = (A[r,k]/A[k,k])
                L[r,k] = factor

                for c in range(0,m):
                    A[r,c] = A[r,c] - (factor*A[k,c])
                    U[r,c] = A[r,c]
    resultado = [L,U]
    print(U)

##    print(resultado[0])
##    print(resultado[1])
    return [L,U]

A = np.array([[4,-2,1],[20,-7,12],[-8,13,17]])
#triangularLU(A)
L = np.array([[1,0,0],[5,1,0],[-2,3,1]])
b = np.array([11,70,17])
n = len(L)
print(n)
U = np.array([[4,-2,1],[0,3,7],[0,0,-2]])
LYb = np.array([11,15,-6])
#i = len(U)-1
vectorX = np.zeros(n)
#vectorX = np.zeros(i+1)
Lyb (L,b,0,vectorX)
#n = i
#Uxy(U,LYb,i,vectorX,n)

print('--------------------')

factorizacion_LU(A,b)

