class Usuario

  attr_reader :nombre_de_usuario
  attr_reader :clave_de_usuario

  def initialize(usuario_inicial, clave_inicial)

    @nombre_de_usuario = usuario_inicial
    @clave_de_usuario = clave_inicial

  end

end
