function [ tabla ] = punto_fijo (a,n,delta,tol)

format long

i=0;
funcionvalue=delta+1;
error=tole+1;


%Programa de metodo de punto fijo

	while i<n & funcionvalue>delta & error>tole 
	
		format long 
		
		i=i+1; %numero de iteraciones a realizar
		tabla(i,1)=i;
		
		x = gun(a); %evaluar el punto de busquedas en la funcion
		tabla(i,2)=x;
		
		y= funcion(x); %evaluar x en la funcion principal 
		tabla(i,3)=y;
		
		funcionvalue= abs(y);
		%error= abs(x-a); %calculo del error
		%error=abs(x-a)/abs(x); %error relativo
		%error=(abs(x-a)/abs(x))*100; %error porcentual
		tabla(i,4)=error;
		
		a = x; %Para que el programa sepa cuando detenerse
		
		
	endwhile
endfunction