require_relative '../caesar_cipher'

describe CaesarCipher do

  let (:encriptador) {CaesarCipher.new}
  let (:clave_encriptada) {CaesarCipher.new.encriptar 'ClaveUsuario'}

  it "Encriptacion de una clave de usuario" do
    expect(encriptador.encriptar('ClaveACifrar')).to eq 'FodyhDFliudu'
  end

  it "validacion de una clave de usuario correcta" do
    expect(encriptador.validar_claves(clave_encriptada,'ClaveUsuario')).to be true
  end

  it "validacion de una clave de usuario incorrecta" do
    expect(encriptador.validar_claves(clave_encriptada,'ClaveUsuarioIncorrecta')).not_to be true
  end
end
