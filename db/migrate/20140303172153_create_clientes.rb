class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.text :c_targeta_cliente
      t.text :nombre
      t.text :a_paterno
      t.text :a_materno
      t.text :email
      t.text :t_celular
      t.text :domicilio
      t.integer :c_postal
      t.text :sexo
      t.date :fecha_alta

      t.timestamps
    end
  end
end
