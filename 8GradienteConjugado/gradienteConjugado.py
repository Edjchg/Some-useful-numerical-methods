import numpy as np
import sympy as sy
from sympy import symbols,solve
from numpy import linalg as LA
import random

a,b,c,d,e,f,g,h,i,j,k,l,m,n,ñ,o,p,q,r,s,t,u,v,w,x,y,z = symbols('a b c d e f g h i j k l m n ñ o p q r s t u v w x y z')



#Entradas:   f  -> función deseada por el usuario.
#           vector_variables -> las variables que tiene la ecuación.
#           vector_valores   -> valores iniciales de cada respectiva variable
#           iteraciones-> cantidad de iteraciones requeridas.

#Salidas:
#         resultado -> Vector con los resultados de cada variable en orden.



def gradiente_conjugado (f, vector_variables, vector_valores, iteraciones):
    f = sy.sympify(f)
    
    return gradiente_conjugado_Aux(f, vector_variables, vector_valores, iteraciones,0, np.array([]),np.array([]),1)

def gradiente_conjugado_Aux(f, vector_variables, vector_valores, iteraciones,contador, g_0,d_0,alfa):
    if contador == 0:
        g_0 = gradiente(f,vector_variables, vector_valores)
        g_0 = np.array(g_0)
        g_0 = g_0.transpose()

        d_0 = (-1)*g_0

    alfa = alfa_k(f,vector_variables, vector_valores, g_0,d_0,alfa)
    alfa_por_d = alfa*d_0 
    vector_valores_sig = np.add(vector_valores,alfa_por_d)
    print(vector_valores_sig)

    if contador == iteraciones:
        print(vector_valores_sig)
        return vector_valores_sig

    else:
        
        g_sig = gradiente(f,vector_variables,vector_valores_sig)
        g_sig = np.array(g_sig)
        
        B_k = (LA.norm(g_sig,-2)**2)/(LA.norm(g_0,-2)**2)
        
        d_0 = B_k*d_0
        g_0 = (-1)*g_0
        
        d_sig = np.add(g_0,d_0)

        #print(d_sig)
        return gradiente_conjugado_Aux(f, vector_variables,vector_valores_sig,iteraciones, contador+1,g_sig,d_sig,alfa)

def gradiente(f,vector_variables, vector_valores):
    f = sy.sympify(f)
    resultado = []
    ix = 0
    while ix!= len(vector_variables):
        subparteGradiente = f.diff(vector_variables[ix])
        jx = 0
        
        while jx != len(vector_variables):
            subparteGradiente = subparteGradiente.subs(vector_variables[jx],vector_valores[jx])
            
            jx += 1
        #print(subparteGradiente)
        #gradienteEvaluado = subparteGradiente.subs(vector_variables[ix],vector_valores[ix])

        resultado.append(subparteGradiente)
        ix += 1

    print(resultado)
    return resultado


#            [x,y]                 [0,3]= x_k      g  d -> todos deben ser np.array
def alfa_k(f,vector_variables, vector_valores,g,d,a_k):

    f = sy.sympify(f)
    
    
    delta = 0.5
    alfa_por_d = a_k*d
    
    x_mas_alfa_por_d = np.add(vector_valores,alfa_por_d)

    #Evaluar la funcion de f(x_k + alfa*d)
    funcion1 = eval_V(f, vector_variables, x_mas_alfa_por_d)

    #Evaluar la función de f(x_k)

    funcion2 = eval_V(f,vector_variables, vector_valores)

    #Multiplicación de alfa*delta*gT*d

    multi = a_k*delta*(np.dot(g,d))

    if funcion1 - funcion2 <= multi:
        #print(a_k)
        return a_k
    else:
        
        return alfa_k(f,vector_variables, vector_valores, g, d, a_k/2)
    
    
def eval_V(f, vector_variables, vector_valores):
    f = sy.sympify(f) 
    ix = 0
    while ix != len(vector_variables):
        f = f.subs(vector_variables[ix], vector_valores[ix])
        ix += 1
    
    return f



#g = np.array([-44,24])
#g = g.transpose()

#d = np.array([44,-24])
#d = d.transpose()



#alfa_k('(x-2)^4+(x-2*y)^2',[x,y],[0,3],g,d,1)

#gradiente_conjugado('(x-2)^4 +(x-2*y)^2', [x,y], [0,3], 13)  

gradiente('(x-2)^4 +(x-2*y)^2',[x,y],[0,3])



 
