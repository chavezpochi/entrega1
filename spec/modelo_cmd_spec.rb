require_relative '../modelo_cmd'


describe ModeloCMD do

    before :each do
      @modelo = ModeloCMD.new
      @modelo.registrar_usuario'chavez','ch'
      @modelo.registrar_usuario'rodrigo','rd'
    end

    describe "encriptacion_texto_plano"do
      it "elccion de texto plano como encriptacion"do
        expect(@modelo.encriptacion_texto_plano).to be_a TextoPlano
      end
    end

    describe "encriptacion_bcrypt"do
      it "elccion de bcrypt como encriptacion"do
        expect(@modelo.encriptacion_bcrypt).to be_a Bcrypt
      end
    end

    describe "encriptacion_caesar_cipher"do
      it "elccion de caesar cipher como encriptacion"do
        expect(@modelo.encriptacion_caesar_cipher).to be_a CaesarCipher
      end
    end

    describe "existe_usuario_logeado?" do
      it "Al menos un usuario logeado" do
        @modelo.logear_usuario'chavez','ch'
        expect(@modelo.existe_usuario_logeado?).to be true
      end
      it "Ningun usuario se encuentra logeado"do
        expect(@modelo.existe_usuario_logeado?).to be false
      end
    end

    describe "registrar_usuario" do
      it "registrar un usuario correctamente" do
        @modelo.registrar_usuario 'pepe','pp'
        expect(@modelo.logear_usuario 'pepe','pp').to be true
      end
      it "Se intenta registrar un usuario existente"do
        expect{
          @modelo.registrar_usuario 'chavez','chaa'
        }.to raise_error(UsuarioExistente)
      end
    end

    describe "logear_usuario" do
      it "logear un usuario exitosamente"do
        expect(@modelo.existe_usuario_logeado?).to be false
        @modelo.logear_usuario 'chavez','ch'
        expect(@modelo.existe_usuario_logeado?).to be true
      end
      it "logeo fallido por clave incorrecta"do
        expect{
          @modelo.logear_usuario 'chavez','cha'
        }.to raise_error(ClaveIncorrecta)
      end
      it "logeo fallido por nombre de usuario incorrecto"do
        expect{
          @modelo.logear_usuario 'pepe','ch'
        }.to raise_error(UsuarioInexistente)
      end
      it "logeo fallido por clave incorrecta y nomrbre de usuario"do
        expect{
          @modelo.logear_usuario 'pepe','clave'
        }.to raise_error(UsuarioInexistente)
      end
    end

    describe "deslogear_usuario" do
      it "existe un usuario logeado"do
        @modelo.logear_usuario'chavez','ch'
        expect(@modelo.existe_usuario_logeado?).to be true
        @modelo.deslogear_usuario
        expect(@modelo.existe_usuario_logeado?).to be false
      end
      it "no existe ningun usuario logeado"do
        expect{
          @modelo.deslogear_usuario
        }.to raise_error(NingunUsuarioLogeado)
      end
    end
end
