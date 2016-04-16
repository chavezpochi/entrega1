class CaesarCipher

  def initialize

    @alfabeto = 'a-z' + 'A-Z'
    @alfabeto_cifrado = 'd-zabc' + 'D-ZABC'

  end
  def encriptar (una_clave)

    una_clave.tr(@alfabeto,@alfabeto_cifrado)

  end

  def desencriptar(clave)

      clave.tr(@alfabeto_cifrado,@alfabeto)

  end

  def validar_claves(clave_existente,clave_ingresada)

    clave_ingresada == self.desencriptar(clave_existente)

  end

end
