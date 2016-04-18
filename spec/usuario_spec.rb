require_relative '../usuario'

describe Usuario do

  let (:usuario){Usuario.new 'nombre','clave'}

  it "Tiene un estado logeado usuario_logeado= false después de la creación" do
    expect(usuario.logeado).to be false
  end

  it "Al Logear un usuario su estado Logeado pasa a ser true" do
    expect(usuario.logear).to be true
    expect(usuario.logeado).to be true
  end

  it "Al deslogear un usuario logeado su estado Logeado pasa a ser false " do
    usuario.logear
    expect(usuario.logeado).to be true
    usuario.desloguear
    expect(usuario.logeado).to be false
  end
end
