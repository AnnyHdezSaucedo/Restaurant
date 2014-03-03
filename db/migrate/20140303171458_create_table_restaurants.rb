class CreateTableRestaurants < ActiveRecord::Migration
  def change
    create_table :table_restaurants do |t|
      t.text :nombre
      t.text :direccion
      t.decimal :saldo
      t.text :municipio

      t.timestamps
    end
  end
end
