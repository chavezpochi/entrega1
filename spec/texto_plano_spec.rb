require_relative '../texto_plano'


describe TextoPlano do

    let (:encriptador) {TextoPlano.new}
    let (:clave_encriptada) {TextoPlano.new.encriptar 'ClaveUsuario'}

    it "Encriptacion de una clave de usuario" do
      expect(encriptador.encriptar('ClaveACifrar')).to eq 'ClaveACifrar'
    end

    it "validacion de una clave de usuario correcta" do
      expect(encriptador.validar_claves('ClaveUsuario',clave_encriptada)).to be true
    end

    it "validacion de una clave de usuario incorrecta" do
      expect(encriptador.validar_claves('clave_incorrecta',clave_encriptada)).not_to be true
    end

end
