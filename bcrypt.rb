require 'bcrypt'

class Bcrypt

  attr_reader :hash,:clave_encriptada
  include BCrypt


  def encriptar(una_clave)


    Password.create(una_clave, :cost => 15)

  end

  def validar_claves(clave_existente,clave_ingresada)

     Password.new(clave_existente) == clave_ingresada

  end


end
