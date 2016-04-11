require './usuario'
require './texto_plano'
class Controlador

    def initialize (usuario_inicial = "pochi",clave_inicial = "holis")

        @clave_cifrada = TextoPlano.new.cifrar_clave(clave_inicial)
        @usuario =  Usuario.new(usuario_inicial,@clave_cifrada)

    end

    def validar_usuario(usuario,clave)

      if   (@usuario.nombre_de_usuario == usuario) & (@usuario.clave_de_usuario == clave)
          "Bienvenido #{@usuario.nombre_de_usuario}"

      else
      "la clave o usuario son incorrectos"
      end
    end
end
