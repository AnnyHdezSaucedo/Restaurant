class CreatePago2s < ActiveRecord::Migration
  def change
    create_table :pago2s do |t|
      t.integer :restaurant
      t.integer :usuario
      t.integer :cliente
      t.date :fecha
      t.decimal :total
      t.text :promocion
      t.text :nombre
      t.text :factura
      t.decimal :pago_tarjeta

      t.timestamps
    end
  end
end
