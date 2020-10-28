#Entradas:   f  -> función deseada por el usuario.
#           variables -> las variables que tiene la ecuación.
#           valores_iniciales -> valores iniciales de cada respectiva variable
#           tol -> tolerancia que desee el usuario.
#           iteraciones-> cantidad de iteraciones requeridas.

#Salidas: iteraciones -> cantidad de veces que el algoritmo se debe repetir
#                        talque se cumpla con la tolerancia asignada.
#         resultado         -> Vector con los resultados de cada variable en orden.

function resultado = descensoCoordinado(f, variables, variablesString, valoresIniciales, tol, iteraciones)
  #pkg load symbolic
  #syms a b c d e f g h i j k l m n ñ o p q r s t u v w x y z
  asignaValores(['x' 'y'], [1 1], 1, '(x - 2)^2 + (y + 3)^2 + x*y')
  #descensoCoordinadoAux(f,variables,variablesString,valoresIniciales, tol, iteraciones, 0,1) 
endfunction

function valoresIniciales = descensoCoordinadoAux(f, variables,variablesString ,valoresIniciales, tol, iteraciones,contador, indice)
  cantidad_de_variables = length(variables)
  if indice == cantidad_de_variables
    indice = 1
  endif
  #Condición de parada con la cantidad de iteraciones.
  if contador == iteraciones
    resultado = valoresIniciales
    return
  else
    valoresIniciales(indice) = asignaValores(variables,valoresIniciales, indice,f)
    descensoCoordinadoAux(f, variables, valoresIniciales, tol, iteraciones,contador + 1, indice + 1) 
  endif
endfunction

# Función que excepciona una variable y sustitutye todas las demás con sus valores respectivos y retorna la solución de la derivada de la función evaluada, posteriormente el minimo.

function resultado1 = asignaValores(variables, valoresIniciales, indice, f)
  #syms a b c d e f g h i j k l m n ñ o p q r s t u v w x y z
  ix = 1
  while ix != length(variables)+1
    
    if ix == indice
      ix = ix + 1
      
    else
      
      #variables(ix) = valoresIniciales(ix)
      #variableS = genvarname(variables(ix))
      #eval([variableS "= valoresIniciales(ix)"])
      
      #f =  eval(f)
      
      x = sym(variables(ix))
      
      f = subs(f,x,valoresIniciales(ix))
      
      
      
      
      ix = ix + 1  
    endif
    
          
  endwhile
  resultado1 = f
  f = diff(f, sym(variables(indice))) 
  resultado1 =  solve(f,sym(variables(indice)))
  #resultado1 = resultado1(1)
  return
endfunction
#descensoCoordinado('(x - 2)^2 + (y + 3)^2 + x*y', [x y] ,['x' 'y'], [1 1], 0, 9)

# f = solve(expr,x)

#a = ['x y']
#variable = genvarname(a(1))
#b = [1 2]

#eval([variable "= b(1)"])

#asignaValores([x y], [1 1], 1, '(x - 2)^2 + (y + 3)^2 + x*y')

