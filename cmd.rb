require 'highline/import'
require './controlador'
require './menu_encriptador'
require './excepcion'
salir = false
estado = 'Deslogeado'
@controlador = ControladorCMD.new
@menu_encriptador = MenuEncriptador.new
@menu_encriptador.seleccion_de_encriptacion @controlador
while !salir do

	choose do |menu|

		say "\n--Bienvenido, que decea hacer?--"
	
		if @controlador.existe_usuario_logeado?
			menu.choice(:Logout)do
			say("Usted se ha Deslogeado")
			estado = 'Deslogeado'
			@controlador.deslogear_usuario
			end

		else
				menu.choice(:Login) do
					usuario = ask("Ingrese su usuario: ")
					clave = ask("Ingrese su clave: ") { |q| q.echo = "x" }
					begin
						@controlador.logear_usuario(usuario,clave)
							estado = "Logeado como #{usuario}"
							say "Bienvenido"
					rescue
							say "<%= color('Usuario y contraseña incorrectos',RED) %>"
					end
				end
				menu.choice(:Register) do

					usuario = ask("Ingrese nombre de usuario: ")
					clave = ask("Ingrese la clave con la cual se logeara: ") do |q|
						q.echo = "x"
						q.validate = /^[A-Za-z]+$/
						q.responses[:not_valid] = 'No se permiten numeros ni caracteres especiales'
					end
					begin
						@controlador.registrar_usuario usuario,clave
						say "Usuario registrado correctamente"
					rescue
						say "<%= color('Nombre de usuario en uso pruebe de nuevo',RED) %>"
					end
				end
		end
		menu.choice(:Estado)do
			say ("Usted se encuentra: #{estado}")
		end

		menu.choice(:Salir)do
			salir = true
			say ("Gracias por venir")
		end

	end
end
