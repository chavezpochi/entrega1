require './usuario'
require './encriptador'
class ModeloCMD

  def initialize(usuario_inicial = 'pochi',clave_inicial = 'holis')

    @encriptador = Encriptador.new
    usuario_inicial = Usuario.new usuario_inicial,@encriptador.encriptar(clave_inicial)
    @usuarios = [usuario_inicial]

  end

  def crear_usuario(nombre_de_usuario,clave_de_usuario)

    clave_encriptada = @encriptador.encriptar(clave_de_usuario)
    Usuario.new(nombre_de_usuario,clave_encriptada)

  end

  def agregar_usuario(un_usuario)@encriptador = Encriptador.new

    @usuarios << un_usuario

  end

  def eliminar_usuario(un_usuario)

    @usuarios.delete(un_usuario)

  end

  def deslogear_usuario

    @usuario_actual.desloguear

  end

  def existe_usuario_logeado?

    @usuarios.any? {|usuario| usuario.logeado}

  end

  def buscar_usuario(nombre_de_usuario)
    #dos usuarios son iguales si su nombre de usuario es el mismo
    @usuarios.detect(-> do
        raise ArgumentError, 'Usuario no existente'
    end) {|usuario| usuario.nombre_de_usuario == nombre_de_usuario}
  end

  def registrar_usuario(nombre_de_usuario,clave_de_usuario)

    usuario_a_registrar = crear_usuario(nombre_de_usuario,clave_de_usuario)
    begin
      buscar_usuario(nombre_de_usuario)
      raise 'El usuario ya existe, pruebe de nuevo'
    rescue ArgumentError
          agregar_usuario(usuario_a_registrar)

    end
  end

  def validar_usuario(usuario_ingresado,clave_ingresada)

      usuario = buscar_usuario(usuario_ingresado)
      if @encriptador.validar_claves(usuario.clave_de_usuario,clave_ingresada)
        @usuario_actual = usuario
        @usuario_actual.logear
      else
          raise 'clave incorrecta'
      end

  end

end
