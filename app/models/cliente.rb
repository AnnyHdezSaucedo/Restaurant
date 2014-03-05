class Cliente < ActiveRecord::Base
 # attr_accessible :nombre, :a_paterno, :a_materno, :email, :t_celular, :domicilio, :fecha_alta

  #validates :nombre, :a_paterno, :a_materno, :email, :t_celular, :domicilio, :fecha_alta, presence=> true
  #validates :email, :t_celular, :uniqueness => {:message => "Existe un cliente registrado con este correo "}

  private 
  def cliente_params
  	params.require(:cliente).permit(:c_targeta_cliente, :nombre, :a_paterno, :a_materno, :email, :t_celular, :domicilio, :fecha_alta, :c_postal, :sexo, :fecha_alta)
  end
end
