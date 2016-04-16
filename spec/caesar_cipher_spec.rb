require_relative '../caesar_cipher'

describe CaesarCipher do

  let (:encriptador) {CaesarCipher.new}

  it "Encriptacion de una clave de usuario" do

    expect(encriptador.encriptar('ClaveACifrar')).to eq 'FodyhDFliudu'

  end

  it "validacion de una clave de usuario correcta" do

    clave_existente = encriptador.encriptar('ClaveUsuario')
    expect(encriptador.validar_claves(clave_existente,'ClaveUsuario')).to be true
  end

  it "validacion de una clave de usuario incorrecta" do
      clave_existente = encriptador.encriptar('ClaveUsuario')
      expect(encriptador.validar_claves(clave_existente,'ClaveUsuarioIncorrecta')).not_to be true
  end


end
