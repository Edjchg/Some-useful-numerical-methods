import numpy as np
import sympy as sy
from sympy import *
from math import *

#Entradas:   f  -> función deseada por el usuario.
#           x_0 -> valor inicial para proceder con este método.
#         [a,b] -> par ordenado en donde se evaluará la función.
#           tol -> tolerancia que desee el usuario.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         x_k         -> valor final de la posible solución de la ecuación.

def puntoFijo(fDespejada, a, b, x_0, tol):
    x = sy.symbols('x')
    expr = sy.sympify(fDespejada)

    #Phi evaluada en a
    phi_x_en_a = expr.evalf(subs={x:a})
    #Phi evaluada en b
    phi_x_en_b = expr.evalf(subs={x:b})

    #Se deriva phi
    phiDerivada = expr.diff(x)
    #Se deriva por segunda vez a Phi
    phiSegundaDerivada = phiDerivada.diff(x)
    #Se encuentran los puntos criticos
    puntoCritico = solve(Eq(phiSegundaDerivada,0))
    print(phiSegundaDerivada)
    print(puntoCritico)
    puntoCritico1 = abs(puntoCritico[0])

    dPhiPuntoCritico = phiDerivada.evalf(subs={x:puntoCritico1})

    dPhi_A = phiDerivada.eval(subs={x:a})

    dPhi_B = phiDerivada.eval(subs={x:b})

    puntoCritico = solve(Eq(phiSegundaDerivada,0))
    
    #Evaluación de existencia.
    if (a <= phi_x_en_a <= b) ^ (a <= phi_x_en_b <= b) == True:
        
        #Evaluación de Unicidad.
        if (-1 <= dPhi_A <= 1) ^ (-1 <= dPhi_B <= 1) ^ (-1 <= dPhiPuntoCritico <= 1) == True:
            
            return puntoFijoAux(fDespejada, x_0, tol)
        else:
            return "Este despeje de f(x) no converge, use otro despeje."
            
    else:
        return "Este despeje de f(x) no converge, use otro despeje."

def puntoFijoAux(fDespejada,x_0, tol, iteraciones):
    
    x = sy.symbols('x')
    expr = sy.sympify(fDespejada)
    
    x_1 = expr.evalf(subs={x:x_0})
    df = expr.diff(x)
    L = df.evalf(subs={x:x_0})

    iterMax = math.log((tol/(x_0-x_1)),L)

    iterMax = math.floor(iterMax)
    

    if 20 >= iteraciones :
        return puntoFijoAux(fDespejada, x_1, tol, iteraciones +1)
    else:
         
        print([x_1,iterMax])
        return [x_1,iterMax]
#Nota: para algunas funciones que al derivar queda la variable en el denominador
#Python no puede despejar el valor para sacar los puntos criticos.
puntoFijo('log(2*x + 1)',1,2,2, 0.01)
    
    
    

    
    
