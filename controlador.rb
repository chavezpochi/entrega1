require './modelo_cmd'

class ControladorCMD

  def initialize

    @modelo = ModeloCMD.new

  end
  def encriptacion_texto_plano
    @modelo.encriptacion_texto_plano
  end

  def encriptacion_caesar_cipher
    @modelo.encriptacion_caesar_cipher
  end

  def encriptacion_bcrypt
    @modelo.encriptacion_bcrypt
  end

  def logear_usuario(usuario_ingresado,clave_ingresada)
    @modelo.logear_usuario(usuario_ingresado,clave_ingresada)
  end

  def deslogear_usuario
    @modelo.deslogear_usuario
  end

  def existe_usuario_logeado?
    @modelo.existe_usuario_logeado?
  end

  def  registrar_usuario(nombre_de_usuario,clave_de_usuario)
    @modelo.registrar_usuario(nombre_de_usuario,clave_de_usuario)
  end
end
