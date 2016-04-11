require './usuario'
require './texto_plano'
require './caesar_cipher'
require './bcrypt'
class Controlador

    def initialize (usuario_inicial = "pochi",clave_inicial = "holis")

        @encriptador = Bcrypt.new
        @clave_cifrada = @encriptador.cifrar_clave(clave_inicial)
        @usuario =  Usuario.new(usuario_inicial,@clave_cifrada)

    end

    def validar_usuario(usuario_ingresado,clave_ingresada)

      if   (@usuario.nombre_de_usuario == usuario_ingresado) & 
              (@encriptador.validar_claves(@usuario.clave_de_usuario,clave_ingresada))

          @usuario.logear

      end
    end
    def deslogear_usuario

      @usuario.desloguear

    end

    def usuario_logeado

      @usuario.logeado

    end
end
