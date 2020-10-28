%Instituto Tecnológico de Costa Rica                               |
%Grupo de Ingeniería Aeroespacial: TECSpace.                       |
%Proyecto Miravalles I.                                            | 
%Sub-grupo: Propulsión.                                            |
%Estudiante: Edgar Chaves González. Correo: edjchg@gmail.com       |
%------------------------------------------------------------------- 

%Gamma normalmente es 1.4 pues se está en el aire.
function a = MOC(radio_garganta, presion_recamara, temperatura_recamara, empuje, flujo_masico,altitud, gamma, constante_gases)
  pkg load io
  %Calculando la presión de salida de la tobera.
  if (11000 > altitud) && (altitud < 25000)
    
    temperatura     = -56.46 %Con unidades de Celsius.
    presion_salida  = 1000*(22.65*exp(1.73 - 0.000157*altitud))
    
  elseif (altitud >= 25000)
    
    temperatura     = -131.21 + 0.00299*altitud
    presion_salida  = 1000*(2.488*((temperatura + 273.1)/(216.6))^ (-11.388))
    
  else
    
    temperatura     = 15.04 - 0.00649*altura
    presion_salida  = 1000*(101.29*((temperatura + 273.1)/(288.08))^ (5.256))
    
  endif
  
  %Cálculo de parametros iniciales razon de presion, razon de temperatura, temperatura en la garganta,
  %presion en la garganta, velocidad, velocidad de salida.
  
  razon_presion                 = presion_salida/presion_recamara
  razon_temperatura             = (razon_presion)^((gamma - 1)/gamma)
  temperatura_critica_garganta  = (2*gamma*constante_gases*temperatura_recamara)/(gamma - 1)
  presion_critica_garganta      = 2.068*((2/(gamma + 1))^(gamma/(gamma - 1)))
  velocidad_critica_garganta    = sqrt((2*gamma*constante_gases*temperatura_recamara)/(gamma + 1))
  velocidad_salida              = sqrt(temperatura_critica_garganta*(1 - razon_temperatura))
  
  %Como el parametro flujo masico o el empuje son opcional entonces hay que verificar si no se puso, entonces calcularlo.
  
  if (flujo_masico == 0)
    flujo_masico = empuje/velocidad_salida
  elseif (empuje == 0)
    empuje = flujo_masico/velocidad_salida
  endif
  
  temperatura_salida = temperatura_recamara*(presion_salida/presion_recamara)^((gamma - 1)/ gamma)
  velocidad_sonido   = sqrt(gamma*constante_gases*temperatura_salida)
  NUMERO_MACH        = velocidad_salida/velocidad_sonido
  
  %------Metodo de características:---------
  
  
  %Funcion de Prendtl-Mayer:
  
  constante1 = sqrt((gamma + 1)/(gamma - 1));
  constante2 = (gamma - 1)/(gamma + 1);
  
  %La Funcion de Prendtl-Mayer depende del numero MACH, en este caso se representa con x.
  funcion_Prendtl = @(x) constante1*atan(sqrt(constante2*(x^2 - 1))) - atan(sqrt(x^2 - 1));
  
  %Calculo de los puntos del eje x de la tobera.
  lista_puntos_x = [];
  t = [];
  M = []; %Lista de numeros MACH para cada punto analizado.
  pendientes = [];
  lineas_caracteristicas_derechas = [];
  lineas_caracteristicas_izquierdas = [];
  angulo_theta_max = (1/2)*funcion_Prendtl(NUMERO_MACH)  
  
  theta_grados = radianes_a_grados(angulo_theta_max)
  
  delta_angulo = 2*((90 - theta_grados) - fix(90 - theta_grados));
  
  t(1) = grados_a_radianes(delta_angulo);
  
  n = theta_grados*2;
  
  
  for m = 2: n + 1
    
    t(m) = grados_a_radianes(delta_angulo + (m - 1));
    
    %Metodo numerico de la falsa posición para analizar el nnumero MACH.
    
    x_numerico = [1 1.01*NUMERO_MACH];
    
    falsa_posicion = @(x) t(m) - funcion_Prendtl(x);
    
    M(m) = fzero(falsa_posicion, x_numerico); %obtener las raices cerca de x_numerico.
    
    lista_puntos_x(m) = radio_garganta*tan(t(m));
    
    %Lineas caracteristicas derechas:
    
    lineas_caracteristicas_derechas(m) = -radio_garganta/lista_puntos_x(m);
    
    %Lineas caracterisiticas izquierdas:
    
    lineas_caracteristicas_izquierdas(m) = tan(t(m) + asin(1/M(m)));
    
    %La pendiente es m:dy/dx.
    pendientes(m) = -lineas_caracteristicas_derechas(m); %Es la reflexion de las lineas caracteristicas derechas 
    
  endfor
  
  %Mostrando las lineas caractetisticas y los puntos en el eje x.
  
  lista_puntos_x(1) = []; %Se elimina el primer elemento de la lista_de_puntos_x.
  
  l = length(lista_puntos_x);
  
  for j = 1: l
    puntos1 = [0 radio_garganta];
    puntos2 = [lista_puntos_x(j) 0];
    plot(puntos2, puntos1, 'k');
    hold on
    xlabel('linea central')
    ylabel('radio')
  endfor
  
  %Mostrando las reflexiones de las lineas anteriormente encontradas.
  hold on
  
  lineas_caracteristicas_izquierdas(1) = [];
  
  pendientes(1) = [];
  
  f = lineas_caracteristicas_derechas(m -1);
  
  puntosX = [];
  puntosY = [];
  
  for h = 1: l - 1
    puntosX(h) = (radio_garganta + pendientes(h)*lista_puntos_x(h))/(pendientes(h) - f);
    puntosY(h) = f*puntosX(h) + radio_garganta;
    puntoX = [lista_puntos_x(h) puntosX(h)];
    puntoY = [0 puntosY(h)];
    plot(puntoX, puntoY, 'b')

  endfor
  
  hold on
  
  %La pared inicial:
  puntoXw = [];
  puntoYw = [];
  thetaM = grados_a_radianes(theta_grados);
  puntoXw(1) = (radio_garganta + pendientes(1)*lista_puntos_x(1))/(pendientes(1) - tan(thetaM));
  puntoYw(1) = tan(thetaM)*puntoXw(1) + radio_garganta;
  puntosX_2 = [lista_puntos_x(1) puntoXw];
  puntosY_2 = [lista_puntos_x(2) puntoYw];
  plot(puntosX_2,puntosY_2,'g')
  
  %Ahora haciendo uso del pequeño cambio en el theta, se obtienen las pendientes.
  
  delta_anguloTheta = tan(thetaM)/(l - 1);
  s = [];
  b = [];
  
  s(1) = tan(thetaM);
  b(1) = radio_garganta;
  
  for p = 2: l - 1
    s(p) = tan(thetaM) - (p - 1)*delta_anguloTheta;
    b(p) = puntoYw(p - 1) - s(p)*puntoXw(p - 1);
    
    puntoXw(p) = (b(p) + pendientes(p)*lista_puntos_x(p))/(pendientes(p) - s(p));
    
    puntoYw(p) = s(p)*puntoXw(p) + b(p);
    
    puntosX_3 = [puntosX(p) puntoXw(p)];
    
    puntosY_3 = [puntosY(p) puntoYw(p)];
    
    plot(puntosX_3, puntosY_3, 'r')
  endfor
  
  hold on
  
  %Calculando el radio de Salida.
  
  puntoXw = [0 puntoXw];
  puntoYw = [radio_garganta puntoYw];
  
  Radio_Garganta = radio_garganta
  
  lenPuntosY = length(puntoYw);
  Radio_Salida =  puntoYw(lenPuntosY)
  
  xlswrite('MOCresultadoXY.xlsx', transpose(puntoXw), 'A1:A100');
  xlswrite('MOCresultadoXY.xlsx', transpose(puntoYw), 'B1:B100');

endfunction


function radianes = grados_a_radianes(grados)
  radianes = (grados*pi)/180;
endfunction

function grados = radianes_a_grados(radianes)
  grados = (radianes*180)/pi;
endfunction
