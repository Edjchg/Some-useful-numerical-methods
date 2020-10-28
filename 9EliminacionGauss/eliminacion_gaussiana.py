import numpy.matlib
import numpy as np
import sympy as sy
from sympy import symbols,solve
from numpy import linalg as LA
import random

#Entradas: -> Matriz de coeficientes A
#          -> Vector b
#Salidas:  ->Vector de soluciones del sistema de ecuaciones.
def eliminacion_gaussiana(A,bx):
    triangular = triangular_superior(A,bx)
    A = triangular[0]
    bx = triangular[1]
    ix = len(A)-1
    nx = ix
    vectorX = vectorN(ix+1)
    return eliminacion_gaussianaAux(A,bx,vectorX,ix,nx)



def eliminacion_gaussianaAux(A,bx,vectorX,ix,nx):

    if ix < 0:
        print(vectorX)
        return vectorX
    if ix == nx:
        vectorX[ix] = bx[ix]
        
    else:
        
        
        vectorX[ix] = (1/(A[ix][ix]))*((bx[ix])-suma(ix,0,nx,A,bx,vectorX))


        
    return eliminacion_gaussianaAux(A,bx,vectorX,ix-1,nx)

def suma(ix,jx,nx,A,b,vectorX):
    resultado = 0
    jx = ix + 1
  
    while jx <= nx:
        resultado += (A[ix][jx])*vectorX[jx]
        jx += 1
    return resultado
        
def vectorN(ix):
    vector = []
    for jx in range(0,ix):
        vector.append(1)
    vector = np.array(vector)

    return vector

def triangular_superior(A,b):
    

    jx = 0
    while jx != (len(A)-1):
        ix = jx + 1
        while ix != (len(A)):
            if A[jx][jx] != 1:

                equis0 = 1/A[jx][jx]
                b[jx] = b[jx]*equis0
                A[jx] = A[jx]*equis0
                print(A)
                print(b)
            
            if A[ix][jx] == 0:
                ix += 1
                continue
             
            
                
            else:    

                A[ix] =  A[ix] + sign(A[ix][jx])*abs((A[ix][jx]))*A[jx]

                #b[ix] = b[ix] + (-1)*abs((A[ix][jx]))*b[jx]
                b[ix] = b[ix] + (-1)*abs((A[ix][jx]))*b[jx]
              

                ix += 1
        jx += 1
        
        
    if A[len(A)-1][len(A)-1] != 1:
        
        equis0 = 1/A[len(A)-1][len(A)-1]
        A[len(A)-1][len(A)-1] = A[len(A)-1][len(A)-1]*equis0 
    
    
    return [A,b]

            
    

            
def sign(numero):
    if numero < 0:
        return 1
    elif numero >0:
        return -1
            
        
    
            
#vectorN(3)           

A = np.array([[1,-3,6,8],[0,1,0,-2],[0,0,1,1/3],[0,0,0,1]])
#triangular_superior(np.array([[2,-6,12,16],[1,-2,6,6],[-1,3,-3,-7],[0,4,3,-6]]),np.array([70,26,-30,-26]))
bx = np.array([35,-9,5/3,5])
ix = len(A)-1
vectorX = vectorN(ix+1)
nx = ix

#eliminacion_gaussianaAux(A,bx,vectorX,ix,nx)
#eliminacion_gaussianaAux(np.array([[2,-6,12,16],[1,-2,6,6],[-1,3,-3,-7],[0,4,3,-6]]),np.array([35,-9,5/3,5]),[1,1,1,1],3,3)

eliminacion_gaussiana(A,bx)

    
 
    
