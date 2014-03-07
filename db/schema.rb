# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140303172153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: true do |t|
    t.text     "c_targeta_cliente"
    t.text     "nombre"
    t.text     "a_paterno"
    t.text     "a_materno"
    t.text     "email"
    t.text     "t_celular"
    t.text     "domicilio"
    t.integer  "c_postal"
    t.text     "sexo"
    t.date     "fecha_alta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pago2s", force: true do |t|
    t.integer  "restaurant"
    t.integer  "usuario"
    t.integer  "cliente"
    t.date     "fecha"
    t.decimal  "total"
    t.text     "promocion"
    t.text     "nombre"
    t.text     "factura"
    t.decimal  "pago_tarjeta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_restaurants", force: true do |t|
    t.text     "nombre"
    t.text     "direccion"
    t.decimal  "saldo"
    t.text     "municipio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
