require './usuario'
require './texto_plano'
require './caesar_cipher'
require './bcrypt'

class ModeloCMD

  def initialize
    @usuarios = []
  end

  def encriptacion_texto_plano
    @encriptador = TextoPlano.new
  end

  def encriptacion_caesar_cipher
    @encriptador = CaesarCipher.new
  end

  def encriptacion_bcrypt
    @encriptador = Bcrypt.new
  end

  def deslogear_usuario

    @usuario_actual.desloguear

  end

  def existe_usuario_logeado?

    @usuarios.any? {|usuario| usuario.logeado}

  end

  def registrar_usuario(nombre_de_usuario,clave_de_usuario)

    usuario_a_registrar = crear_usuario(nombre_de_usuario,clave_de_usuario)
    begin
      buscar_usuario(nombre_de_usuario)
      raise UsuarioExistente

    rescue UsuarioInexistente
      agregar_usuario(usuario_a_registrar)

    end
  end

  def validar_usuario(usuario_ingresado,clave_ingresada)

      usuario = buscar_usuario(usuario_ingresado)
      if @encriptador.validar_claves(usuario.clave_de_usuario,clave_ingresada)
        @usuario_actual = usuario
        @usuario_actual.logear
      else
          raise ClaveIncorrecta
      end

  end

  private
    def crear_usuario(nombre_de_usuario,clave_de_usuario)

      clave_encriptada = @encriptador.encriptar(clave_de_usuario)
      Usuario.new(nombre_de_usuario,clave_encriptada)

    end

    def agregar_usuario(un_usuario)
      @usuarios << un_usuario
    end

    def buscar_usuario(nombre_de_usuario)
      #dos usuarios son iguales si su nombre de usuario es el mismo
      @usuarios.detect(-> do
          raise UsuarioInexistente
      end) {|usuario| usuario.nombre_de_usuario == nombre_de_usuario}
    end
    
end
