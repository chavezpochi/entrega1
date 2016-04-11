class CaesarCipher

  def cifrar_clave (una_clave)

    una_clave.tr('a-z','d-zabc')

  end

  def desencriptar(clave)

      clave.tr('d-zabc','a-z')

  end

  def validar_claves(clave_existente,clave_ingresada)

    clave_ingresada == self.desencriptar(clave_existente)

  end

end
