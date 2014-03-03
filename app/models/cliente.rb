class Cliente < ActiveRecord::Base
	attr_accessible :nombre, :a_paterno, :a_materno, :email, :t_celular, :domicilio, :fecha_alta

	validates :nombre, :a_paterno, :a_materno, :email, :t_celular, :domicilio, :fecha_alta, presence=> true
	validates :email, :t_celular, :uniqueness => {:message => "Existe un cliente registrado con este correo "}

end
