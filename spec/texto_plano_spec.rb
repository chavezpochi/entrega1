require_relative '../texto_plano'


describe TextoPlano do
    encriptador = TextoPlano.new
    it "Encriptacion de una clave de usuario" do

      expect(encriptador.cifrar_clave('clave_a_cifrar')).to eq('clave_a_cifrar')

    end
    it "validacion de una clave de usuario" do

      clave_existente = encriptador.cifrar_clave('clave_de_usuario')
      expect(encriptador.validar_claves('clave_de_usuario',clave_existente)).to eq true

    end
end
