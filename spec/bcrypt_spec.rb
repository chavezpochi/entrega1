require_relative '../bcrypt'


describe Bcrypt do

    let (:encriptador) {Bcrypt.new}
    let (:clave_codificada){Bcrypt.new.encriptar 'ClaveUsuario'}

    it "Encriptacion de una clave de usuario" do
      expect(encriptador.encriptar('ClaveACifrar')).to eq 'ClaveACifrar'
    end

    it "validacion de una clave de usuario correcta" do
      expect(encriptador.validar_claves(clave_codificada,'ClaveUsuario')).to be true
    end

    it "validacion de una clave de usuario incorrecta" do
      expect(encriptador.validar_claves(clave_codificada,'clave_incorrecta')).not_to be true
    end

end
