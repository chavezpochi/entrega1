

class MenuEncriptador


  def seleccion_de_encriptacion(un_controlador)

    choose do |menu|

  		menu.prompt = "Seleccione su encriptador"

      menu.choice(:texto_plano) do
        un_controlador.encriptacion_texto_plano
      end
      menu.choice(:caesar_cipher) do
        un_controlador.encriptacion_caesar_cipher
      end
      menu.choice(:bcrypt) do
        un_controlador.encriptacion_bcrypt
      end
    end
  end


end
