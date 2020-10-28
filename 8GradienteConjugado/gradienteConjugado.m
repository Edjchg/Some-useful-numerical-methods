#Entradas:   f  -> función deseada por el usuario.
#           vector_variables -> las variables que tiene la ecuación.
#           vector_valores   -> valores iniciales de cada respectiva variable
#           iteraciones-> cantidad de iteraciones requeridas.

#Salidas:
#         resultado -> Vector con los resultados de cada variable en orden.
#gradienteConjugado('(x-2)^4 +(x-2*y)^2', [x y], [0 3], 13)
function resultado = gradienteConjugado(f,vector_variables,vector_valores,iteraciones)
  pkg load symbolic
  syms a b c d e f g h i j k l m n ñ o p q r s t u v w x y z
  
  gradienteConjugadoAux(f,vector_variables,vector_valores,iteraciones,0,[],[],1)
  
endfunction

function vector_valores_sig = gradienteConjugadoAux(f,vector_variables,vector_valores,iteraciones,contador,g_0,d_0,alfa)
  if contador == 0
    g_0 = gradiente(f,vector_variables,vector_valores)
    g_0 = g_0'
    d_0 = (-1)*g_0
  endif
  
  alfa = alfa_k(f,vector_variables,vector_valores,g_0,d_0,alfa)
  alfa_por_d = alfa*d_0
  vector_valores_sig = vector_valores + alfa_por_d
  
  if contador == iteraciones
    return
  else
    g_sig = gradiente(f,vector_variables,vector_valores,vector_valores_sig)
    B_k = (norm(g_sig,2)**2)/(norm(g_0,2)**2)
    
    d_0 = B_k*d_0
    g_0 = (-1)*g_0
    d_sig = g_0 + d_0
    
    gradienteConjugadoAux(f,vector_variables,vector_valores_sig,iteraciones,contador+1,g_sig,d_sig,alfa)
    
  endif
  
endfunction



function resultado = gradiente(f,vector_variables,vector_valores)
  ix = 0
  while ix != length(vector_variables)
    subparteGradiente = diff(f, vector_variables(ix))
    jx = 0
    while jx != length(vector_variables)
      vector_variables(jx) = vector_valores(jx)
      variables = genvarname(a(jx))
      eval([variables "= vector_valores(ix)"])
      subparteGradiente = eval(subparteGradiente)
      jx = jx +1
    endwhile
    resultado = [resultado subparteGradiente]
  endwhile
  return
endfunction




function valor = alfa_k(f,vector_variables,vector_valores,g,d,a_k)
  delta = 0.5
  alfa_por_d = a_k*d
  x_mas_alfa_por_d = vector_valores + alfa_por_d
  funcion1 = eval_V(f,vector_variables,x_mas_alfa_por_d)
  
  funcion2 = eval_V(f,vector_variables,vector_valores)
  
  multi = a_k*delta*(dot(g,d))
  
  if funcion1 - funcion2 <= multi
    valor = a_k
    return
  else if
    alfa_k(f,vector_variables,vector_valores,g,d,a_k/2)
  endif
endfunction


function resultado = eval_V(f,vector_variables,vector_valores)
  ix = 0
  while ix != lenght(vector_variables)
    vector_variables(ix) = vector_valores(ix)
    variables = genvarname(a(ix))
    eval([variables "= vector_valores(ix)"])
    f = eval(f)
    ix = ix +1
    
  endwhile
  return
  
endfunction

#gradienteConjugado('(x-2)^4 +(x-2*y)^2', [x y], [0 3], 13)