function resultado = descensoCoord(f,vector_variables,vector_valores)
  pkg load symbolic
  
  contador = 1
  
  #a = asignaValores(f,vector_variables,vector_valores,1,contador)
  #resultado = a
  descensoCoord_Aux(f,vector_variables,vector_valores,contador)
  
 
  
endfunction

function vector_valores = descensoCoord_Aux(f,vector_variables,vector_valores,contador)
  
  if contador == length(vector_variables)-1
    contador = 0
    return;
    
  else
   vector_valores(contador) = asignaValores(f,vector_variables,vector_valores,contador, 1)
   
   descensoCoord_Aux(f,vector_variables,vector_valores,indice, contador + 1)
  endif
  vector_nuevos
  
endfunction






function valor = asignaValores(f,vector_variables,vector_valores, indice, contador)
   
  
  if contador == length(vector_variables)-1
    df = diff(f, sym(vector_variables(indice)))
    valor = solve(df, sym(vector_variables(indice)));
   return; 
    
  elseif contador == indice
    asignaValores(f,vector_variables,vector_valores,indice , contador + 1)
    
  else
    x = sym(vector_variables(contador))
    
    f = subs(f,x,vector_valores(contador))
    
    asignaValores(f,vector_variables,vector_valores,indice,contador + 1)
    
  endif
  
    
  
  
  
endfunction
