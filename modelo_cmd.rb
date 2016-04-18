require './usuario'
require './texto_plano'
require './caesar_cipher'
require './bcrypt'
require './excepcion'
class ModeloCMD

  def initialize
    @usuarios = []
    @encriptador = Bcrypt.new
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
#Implica en deslogear el usuario actual, en caso de que no exista se levanta una excepcion
  def deslogear_usuario
    if existe_usuario_logeado?
      @usuario_actual.desloguear
    else
      raise NingunUsuarioLogeado
    end
  end
  #metodo que recorre los usuarios y verifica si al menos uno se encuentra logeado
  def existe_usuario_logeado?
    @usuarios.any? {|usuario| usuario.logeado}
  end
=begin Metodo que dado un nombre y una clave verifica que el nombre de usuario este disponible,
  de ser asi es agregado a la coleccion, de lo contrario se levanta una excepcion de Usuario existente
=end
  def registrar_usuario(nombre_de_usuario,clave_de_usuario)
    usuario_a_registrar = crear_usuario(nombre_de_usuario,clave_de_usuario)
    begin
      buscar_usuario(nombre_de_usuario)
      raise UsuarioExistente

    rescue UsuarioInexistente
      agregar_usuario(usuario_a_registrar)
    end
  end
#logear un usuario ingresado implica validarlo, en caso que exista el usuario se logea, de lo contrario se levanta excepcion
  def logear_usuario(nombre_de_usuario,clave_de_usuario)
      @usuario_actual = validar_usuario(nombre_de_usuario,clave_de_usuario)
      @usuario_actual.logear
  end

  private
=begin Dado un mobre de usuario y una clave ingresados se busca el usuario por el nombre y luego se pide la clave
  para que el encriptador la valide, en caso de que no se encuente el usuario o no sean claves iguales se levanta excepcion
=end
    def validar_usuario(usuario_ingresado,clave_ingresada)
      usuario = buscar_usuario(usuario_ingresado)
      if @encriptador.validar_claves(usuario.clave_de_usuario,clave_ingresada)
        usuario
      else
        raise ClaveIncorrecta
      end
    end
    def crear_usuario(nombre_de_usuario,clave_de_usuario)
      clave_encriptada = @encriptador.encriptar(clave_de_usuario)
      Usuario.new(nombre_de_usuario,clave_encriptada)
    end

    def agregar_usuario(un_usuario)
      @usuarios << un_usuario
    end
=begin metodo que recorre los usuarios comparando nombre de usuario,
  si alguno coincide lo devuelve de lo contrario levanta excepcion
=end
    def buscar_usuario(nombre_de_usuario)
      #dos usuarios son iguales si su nombre de usuario es el mismo
      @usuarios.detect(-> do
          raise UsuarioInexistente
      end) {|usuario| usuario.nombre_de_usuario == nombre_de_usuario}
    end
end
