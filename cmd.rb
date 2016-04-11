require 'highline/import'
require './controlador'

salir = false
estado = 'deslogeado'

while !salir do
	choose do |menu|

		menu.prompt = "Bienvenido, que decea hacer?"

		menu.choice(:Login) do
			usuario = ask("Ingrese su usuario: ")
			clave = ask("Ingrese su clave: ") { |q| q.echo = "x" }
			@controlador = Controlador.new

			say "#{@controlador.validar_usuario(usuario,clave)}"
			estado = 'Logeado'
		end
		
		menu.choice(:Logout)do
			say("Usted se ha Deslogeado")
			estado = 'Deslogeado'
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
