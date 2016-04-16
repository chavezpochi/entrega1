require './texto_plano'
require './caesar_cipher'
require './bcrypt'

class Encriptador

  def initialize

    @tipo_encriptacion = Bcrypt.new

  end


  def metodo_texto_plano
    @tipo_encriptacion = TextoPlano.new
  end

  def metodo_caesar_cipher
    @tipo_encriptacion = CaesarCipher.new
  end

  def metodo_bcrypt
    @tipo_encriptacion = Bcrypt.new
  end

  def encriptar(clave)

    @tipo_encriptacion.encriptar(clave)

  end

  def validar_claves(clave_existente,clave_ingresada)
    @tipo_encriptacion.validar_claves(clave_existente,clave_ingresada)
  end
end
