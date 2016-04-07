require 'highline/import'

salir = false
estado = 'deslogeado'

while !salir do
	choose do |menu|

		menu.prompt = "Bienvenido, que decea hacer?"

		menu.choice(:Login) do
			usuario = ask("Ingrese su usuario: ")
			clave = ask("Enter your password: ") { |q| q.echo = "x" }
			say("Usted se ha Logeado")
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
