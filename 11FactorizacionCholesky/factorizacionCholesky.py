import numpy as np
import math

##1-> L, -> L*L^Tx = b -> Ly=b, y=[], ->conociendo y L^Tx = y, x = []
#Entradas: -> Matriz de coeficientes A
#          -> Vector b
#Salidas:  ->Vector de soluciones del sistema de ecuaciones.

def factorizacion_Cholesky(A,b):
    n = len(A)
    
    L = Linferior(A,0,0)
    
    vectorX = np.zeros(n)
    
    y = Lyb(L,b,0,vectorX)

    L = np.transpose(L)

    i = len(L)-1

    n = i

    x = LTxy(L,y,i,vectorX,n)

    print(x)
    return x



#i = len(U)-1
def LTxy(LT,y,i,vectorX,n):

    if i < 0:
        
        return vectorX
    if i == n:
        vectorX[i] = y[i]/LT[i][i]
        
    else:
        
        
        vectorX[i] = (1/(LT[i][i]))*((y[i])-suma_hacia_atras(i,0,n,LT,y,vectorX))
    return LTxy(LT,y,i-1,vectorX,n)



def suma_hacia_atras(ix,jx,nx,A,b,vectorX):
    resultado = 0
    jx = ix + 1
  
    while jx <= nx:
        resultado += (A[ix][jx])*vectorX[jx]
        jx += 1
    return resultado

#L inferior
def Lyb (L,b,i,vectorX):
    
    resultado_vector_Y = []
    if i > len(b)-1:
        
        return vectorX
    if i==0:
        vectorX[i] = b[i]/L[i][i]
        
    
    else:
        vectorX[i] = (1/(L[i][i]))*((b[i])-suma_hacia_adelante(i,0,L,b,vectorX))

    return Lyb(L,b,i+1,vectorX)

def suma_hacia_adelante(i,j,A,b,vectorX):
    resultado = 0
    j = i - 1
    while j >= 0:
        resultado += (A[i][j]*vectorX[j])
        j -= 1
    return resultado


#i = j = 0
def Linferior(A,i,j):
    m = len(A)
    L = np.zeros([m,m])

    for j in range(0,m):
        i = j
        while i <= m-1:
            

            if i == j:
                L[j][j] = math.sqrt(A[j][j]-sumaJJ(L,j-1,j,0))

            else:
                L[i][j] = (1/L[j][j])*(A[i][j]- sumaIKJK(L,j-1,j,0,i))

            

            i += 1
    return L

def sumaJJ(L,n,j,k):
    resultado = 0
    while k <= n:
        
        resultado += (L[j][k])**2

        k += 1

    return resultado

def sumaIKJK(L,n,j,k,i):
    resultado = 0
    while k <= n:
        resultado += (L[i][k])*(L[j][k])
        k += 1

    return resultado


A = np.array([[25,15,-5,-10],[15,10,1,-7],[-5,1,21,4],[-10,-7,4,18]])

#Linferior(A,0,0)
b = np.array([-25,-19,-21,-5])
factorizacion_Cholesky(A,b)
