#Entrega 1 Laboratorio IV Aplicacion Ruby

Aplicacion basica de Manejo de usuarios y claves encriptadas mediante la consola, con la funcionalidad basica de un login de cualquier aplicacion con manejo de usuarios (logearce, deslogearce, registrarce, etc)

El fin es mostrar los distintos metodos de encriptacion de una pass en la aplicacion:

		1)Texto Plano
		2)Caesar Cipher
		3)Bcrypt
##Requerimientos (Especificado en el GEMFILE.look):
		Plataforma:
			ruby

		Gemas:
			bcrypt
			highline
			rspec (~> 3.2.0)

##Funcionamiento de La Aplicacion

* Para poder correr la aplicacion debe ejecutarce por consola el archivo cmd.rb:
		:~/entrega1$ ruby cmd.rb
* Para poder correr los test debe ejecutar, mediante la consola los archivos ubicados en la carpeta spec mediante el comando rspec perteneciente a la gema: https://github.com/rspec/rspec:
		:~/entrega1$ rspec

###Casos de uso:
		#Seleccion del encriptador:
	
		:~/entrega1$ ruby cmd.rb 
		1. texto_plano
		2. caesar_cipher
		3. bcrypt
		Seleccione su encriptador
		3
		#No existe un usuario predeterminado, debe registrarce:
		--Bienvenido, que decea hacer?--
		1. Login
		2. Register
		3. Estado
		4. Salir
		?2
		Ingrese nombre de usuario: user
		Ingrese la clave con la cual se logeara: xxxxx
		Usuario registrado correctamente
		#Logearce:
		--Bienvenido, que decea hacer?--
		1. Login
		2. Register
		3. Estado
		4. Salir
		?1
		Ingrese su usuario: user
		Ingrese su clave: xxxx
		Bienvenido
		#Estado:
		--Bienvenido, que decea hacer?--
		1. Logout
		2. Estado
		3. Salir
		?2
		Usted se encuentra: Logeado como user
		#Deslogeo:
		--Bienvenido, que decea hacer?--
		1. Logout
		2. Estado
		3. Salir
		?1
		Usted se ha Deslogeado
		--Bienvenido, que decea hacer?--
		1. Login
		2. Register
		3. Estado
		4. Salir
		Bienvenido, que decea hacer?
		4
		Gracias por venir


###Ejemplo Ejecucion de test:

		:~/entrega1$ rspec -fd

		Bcrypt
		  Encriptacion de una clave de usuario
		  validacion de una clave de usuario correcta
		  validacion de una clave de usuario incorrecta

		CaesarCipher
		  Encriptacion de una clave de usuario
		  validacion de una clave de usuario correcta
		  validacion de una clave de usuario incorrecta

		ModeloCMD
        	encriptacion_texto_plano
    		  elccion de texto plano como encriptacion
  		  encriptacion_bcrypt
    		  elccion de bcrypt como encriptacion
  		  encriptacion_caesar_cipher
    		  elccion de caesar cipher como encriptacion
		  existe_usuario_logeado?
			 Al menos un usuario logeado
			 Ningun usuario se encuentra logeado
		  registrar_usuario
			 registrar un usuario correctamente
			 Se intenta registrar un usuario existente
		  logear_usuario
			 logear un usuario exitosamente
			 logeo fallido por clave incorrecta
			 logeo fallido por nombre de usuario incorrecto
			 logeo fallido por clave incorrecta y nomrbre de usuario
		  deslogear_usuario
			 existe un usuario logeado
			 no existe ningun usuario logeado

		TextoPlano
		  Encriptacion de una clave de usuario
		  validacion de una clave de usuario correcta
		  validacion de una clave de usuario incorrecta

		Usuario
		  Tiene un estado logeado usuario_logeado= false después de la creación
		  Al Logear un usuario su estado Logeado pasa a ser true
		  Al deslogear un usuario logeado su estado Logeado pasa a ser false

		Finished in 1 minute 20.77 seconds (files took 0.12574 seconds to load)
		25 examples, 0 failures
		





