require 'highline/import'
require './controlador'

salir = false
estado = 'Deslogeado'
@controlador = ControladorCMD.new

while !salir do

	choose do |menu|

		menu.prompt = "Bienvenido, que decea hacer?"

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
						@controlador.validar_usuario(usuario,clave)
							estado = "Logeado como #{usuario}"
							say "Bienvenido"
					rescue
							say "Usuario y contraseña incorrectos"
					end
				end
				menu.choice(:Register) do

					usuario = ask("Ingrese nombre de usuario: ")
					clave = ask("Ingrese la clave con la cual se logeara: ") { |q| q.echo = "x" }
					begin
						@controlador.registrar_usuario usuario,clave
						say "Usuario registrado correctamente"
					rescue
						say "Nombre de usuario en uso pruebe de nuevo"
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
