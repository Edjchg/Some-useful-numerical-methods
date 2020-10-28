import numpy as np
import sympy as sy
from sympy import symbols,solve
#Instanciando todas las posibles variables, para ecucaciones de n variables, n_máx = 27
a,b,c,d,e,f,g,h,i,j,k,l,m,n,ñ,o,p,q,r,s,t,u,v,w,x,y,z = symbols('a b c d e f g h i j k l m n ñ o p q r s t u v w x y z')

#Entradas:   f  -> función deseada por el usuario.
#           variables -> las variables que tiene la ecuación.
#           valores_iniciales -> valores iniciales de cada respectiva variable
#           tol -> tolerancia que desee el usuario.
#           iteraciones-> cantidad de iteraciones requeridas.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         resultado         -> Vector con los resultados de cada variable en orden.

def descenso_coordinado(f, variables, valoresIniciales, tol, iteraciones):

    f = sy.sympify(f)
    return descenso_coordinadoAux(f, variables, valoresIniciales, tol, iteraciones,0,0)

def descenso_coordinadoAux(f, variables, valoresIniciales, tol, iteraciones,contador, indice):
    
    
    cantidad_de_variables = len(variables)#Sacar el n variables.
    

    if indice == cantidad_de_variables:
        indice = 0

    
    #Condición de parada con la cantidad de iteraciones.
    if contador == iteraciones:
        return valoresIniciales

    else:

        valoresIniciales[indice] = asignaValores(variables,valoresIniciales, indice,f)
        return descenso_coordinadoAux(f, variables, valoresIniciales, tol, iteraciones,contador + 1, indice + 1)
    

# Función que excepciona una variable y sustitutye todas las demás con sus valores respectivos y retorna la solución de la derivada de la función evaluada, posteriormente el minimo.
def asignaValores(variables, valoresIniciales, indice,f):
    
    ix = 0

    while ix != len(variables):
        
        if ix == indice:
            ix += 1
            continue
            
        else:
            
            f = f.subs(variables[ix], valoresIniciales[ix])
            ix += 1
    f = f.diff(variables[indice])

    resultado = solve(f)

    return resultado[0]

descenso_coordinado('(x - 2)^2 + (y + 3)^2 + x*y', [x,y], [1,1], 0, 9)

