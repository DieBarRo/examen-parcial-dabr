//Calcular notas finales de los estudiantes
Funcion finales_estudiantes( estudiantes_actuales, estudiantes)
	
	
	Para i=1 Hasta estudiantes_actuales-1 Con Paso 1 Hacer
		//tomar datos del estudiante actual para los calculos
		nota1 = ConvertirANumero(estudiantes(i,3))
		nota2 = ConvertirANumero(estudiantes(i,4))
		nota3 = ConvertirANumero(estudiantes(i,5))
		inasistencias = ConvertirANumero(estudiantes(i,6))
		
		//Calculo penalizaciones por inasistencias
		penalizacion_inasistencias = 0
		Si inasistencias >= 10 y inasistencias < 15 Entonces
			penalizacion_inasistencias = 0.5
		SiNo
			Si inasistencias >= 15 Entonces
				penalizacion_inasistencias = 1
			Fin Si
		Fin Si
		
		//Calculo nota Final
		nota_final = ((nota1 + nota2 + nota3)/3) - penalizacion_inasistencias
		estudiantes(i,7) = ConvertirATexto(nota_final)
		
	Fin Para
	
	//Mostrar todos los datos de los estudiantes
	Para i=1 Hasta estudiantes_actuales-1 Con Paso 1 Hacer
		Escribir "codigo: ",estudiantes(i,1), " nombre: ", estudiantes(i,2), " nota1: ", estudiantes(i,3), " nota2: ", estudiantes(i,4), " nota3: ", estudiantes(i,5), " inasistencias: ", estudiantes(i,6), " nota final: ", estudiantes(i,7)
	Fin Para
	
	
Fin Funcion


//asignar inasistencias estudiantes
Funcion inasistencias_estudiante( estudiantes_actuales, estudiantes, codigo_t )
	
	estudiante_encontrado = Falso
	codigo_encontrado = 0
	Para i=1 Hasta estudiantes_actuales-1 Con Paso 1 Hacer
		Si codigo_t = estudiantes(i,1) Entonces
			estudiante_encontrado = Verdadero
			codigo_encontrado = i
			
		Fin Si
	Fin Para
	
	Si estudiante_encontrado = Verdadero Entonces
		// Falta agregar verificaciones de asistencias positivas
		Escribir "Digite inasistencias del estudiante"
		leer inasistencias
		
		//Asignar valores
		estudiantes(codigo_encontrado,6) = inasistencias
		
	SiNo
		Escribir "No se encontro a ningun estudiante con ese codigo"
	Fin Si
	
Fin Funcion


//asignar notas estudiante
Funcion notas_estudiante( estudiantes_actuales, estudiantes, codigo_t )
	
	estudiante_encontrado = Falso
	codigo_encontrado = 0
	Para i=1 Hasta estudiantes_actuales-1 Con Paso 1 Hacer
		Si codigo_t = estudiantes(i,1) Entonces
			estudiante_encontrado = Verdadero
			codigo_encontrado = i
		
		Fin Si
	Fin Para
	
	Si estudiante_encontrado = Verdadero Entonces
		// Falta agregar verificaciones de notas entre 0 y 10
		Escribir "Digite primera nota parcial"
		leer nota_1
		Escribir "Digite segunda nota parcial"
		leer nota_2
		Escribir "Digite tercera nota parcial"
		leer nota_3
		
		//Asignar valores
		estudiantes(codigo_encontrado,3) = nota_1
		estudiantes(codigo_encontrado,4) = nota_2
		estudiantes(codigo_encontrado,5) = nota_3
		
	SiNo
		Escribir "No se encontro a ningun estudiante con ese codigo"
	Fin Si
	
Fin Funcion

//Listar estudiantes
Funcion listar_estudiantes( estudiantes_actuales, estudiantes )
	
	//Informar que no hay estudiantes si intento listarlos con 0 registrados
	Si estudiantes_actuales = 1 Entonces
		Escribir "No hay estudiantes registrados aun"
	Fin Si
	
		Para i=1 Hasta estudiantes_actuales-1 Con Paso 1 Hacer
			Escribir "codigo ",estudiantes(i,1), " nombre ", estudiantes(i,2)
		Fin Para
	
	Escribir ""
	
	
Fin Funcion

//agregar_estudiante
Funcion agregar_estudiante( estudiantes_actuales, estudiantes )
	Escribir "Codigo estudiante"
	Leer estudiantes(estudiantes_actuales,1)
	Escribir "Nombre estudiante"
	Leer estudiantes(estudiantes_actuales,2)
	
	Escribir "Estudiante con codigo: ",estudiantes(estudiantes_actuales,1), " y nombre: ",estudiantes(estudiantes_actuales,2) 
	Escribir "Adicionado exitosamente"
	Escribir ""
	
Fin Funcion

//Funcion menu
Funcion opc <- menu 
	Escribir "---Menu Opciones---"
	Escribir "(1) Agregar estudiante"
	Escribir "(2) Agregar Notas Parciales Estudiante"
	Escribir "(3) Registrar inasistencias Estudiante"
	Escribir "(4) Mostrar Listado Estudiantes"
	Escribir "(5) Calcular nota final"
	Escribir "(0) Salir de la Aplicacion"
	Escribir ""
	Leer opc
Fin Funcion

Algoritmo calcular_nota_final
	//matriz 10 x 7 (10 posibles estudiantes)
	//1 columna codigo del estudiante
	//2 columna nombre del estudiante
	//3,4,5 columna son notas parciales del estudiante
	//6 columna inasistencias del estudiante
	//7 columna Nota final del estudiante
	Dimensionar estudiantes(10,7)
	//Llevar la cuenta del numero de estudiantes (siempre es 1 mas de los estudiantes guardados actualmente)
	estudiantes_actuales = 1
	
	
	Repetir
	//selecion de opcion del menu
	opc = menu
	
	Segun opc Hacer
		1:
			//Agregar verificacion para no agregar mas de 10 estudiantes
			Escribir "---Agregar estudiante---"
			Si estudiantes_actuales < 11 Entonces
				agregar_estudiante( estudiantes_actuales, estudiantes )
				estudiantes_actuales = estudiantes_actuales + 1
			SiNo
				Escribir "No se pueden agregar mas de 10 estudiantes"
			Fin Si
			
		2:
			Escribir "---Agregar Notas parciales---"
			Escribir " Digite codigo del estudiante"
			Leer codigo_t
			notas_estudiante( estudiantes_actuales, estudiantes, codigo_t )
		3:
			Escribir "---Agregar inasistencias Estudiante---"
			Escribir " Digite codigo del estudiante"
			Leer codigo_t
			inasistencias_estudiante( estudiantes_actuales, estudiantes, codigo_t )
		4:
			Escribir "---Mostrar Listado Estudiantes---"
			listar_estudiantes( estudiantes_actuales, estudiantes )
		5:
			Escribir "---Calcular notas finales---"
			finales_estudiantes( estudiantes_actuales, estudiantes)
		0:
			Escribir "---Salio de la aplicacion---"
			
		De Otro Modo:
			Escribir "Opcion incorrecta por favor digite un numero entre 0 y 5"
	Fin Segun
	
	
		
Hasta Que opc = 0

	
FinAlgoritmo
