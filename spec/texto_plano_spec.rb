require_relative '../texto_plano'


describe TextoPlano do

    let (:encriptador) {TextoPlano.new}

    it "Encriptacion de una clave de usuario" do

      expect(encriptador.encriptar('clave_a_cifrar')).to eq 'clave_a_cifrar'

    end

    it "validacion de una clave de usuario correcta" do

      clave_existente = encriptador.encriptar('clave_de_usuario')
      expect(encriptador.validar_claves('clave_de_usuario',clave_existente)).to be true
    end

    it "validacion de una clave de usuario incorrecta" do
        clave_existente = encriptador.encriptar('clave_de_usuario')
        expect(encriptador.validar_claves('clave_incorrecta',clave_existente)).not_to be true
    end

end
