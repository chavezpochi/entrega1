require_relative '../bcrypt'


describe Bcrypt do

    let (:encriptador) {Bcrypt.new}

    it "Encriptacion de una clave de usuario" do

      expect(encriptador.encriptar('ClaveACifrar')).to eq 'ClaveACifrar'

    end

    it "validacion de una clave de usuario correcta" do
      clave_existente = encriptador.encriptar('clave_de_usuario')
      expect(encriptador.validar_claves(clave_existente,'clave_de_usuario')).to be true
    end

    it "validacion de una clave de usuario incorrecta" do
      clave_existente = encriptador.encriptar('clave_de_usuario')
      expect(encriptador.validar_claves(clave_existente,'clave_incorrecta')).not_to be true
    end

end
