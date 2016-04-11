require 'highline/import'
require './controlador'

salir = false
estado = 'Deslogeado'
@controlador = Controlador.new
while !salir do

	choose do |menu|

		menu.prompt = "Bienvenido, que decea hacer?"

		if @controlador.usuario_logeado
			menu.choice(:Logout)do
			say("Usted se ha Deslogeado")
			estado = 'Deslogeado'
			end
			@controlador.deslogear_usuario

		else
				menu.choice(:Login) do
				usuario = ask("Ingrese su usuario: ")
				clave = ask("Ingrese su clave: ") { |q| q.echo = "x" }
				if @controlador.validar_usuario(usuario,clave)
					estado = "Logeado como #{usuario}"
					say "Bienvenido"
				else
					say "La clave y/o usuarios no son correctos"
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
