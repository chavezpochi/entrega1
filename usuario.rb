class Usuario

  attr_reader :nombre_de_usuario, :clave_de_usuario, :logeado

  def initialize(usuario_inicial, clave_inicial)

    @nombre_de_usuario = usuario_inicial
    @clave_de_usuario = clave_inicial
    @logeado = false
  end

  def logear 

    @logeado = true

  end

  def desloguear

    @logeado = false

  end
end
