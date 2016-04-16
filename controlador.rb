require './modelo_cmd'

class ControladorCMD

  def initialize

    @modelo = ModeloCMD.new

  end

  def validar_usuario(usuario_ingresado,clave_ingresada)
    @modelo.validar_usuario(usuario_ingresado,clave_ingresada)
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
