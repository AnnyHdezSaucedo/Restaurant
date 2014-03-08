# para pruebas de coverage
require 'simplecov'
SimpleCov.start

require 'test_helper'
require 'rubocop/rake_task'

# Clase de pruebas de ClientesController
class ClientesControllerTest < ActionController::TestCase
    
    setup :initialize_cliente
    # setup do
    # @clientes = clientes(:one)
    # end
    
    test 'should get index' do
    get :index
    assert_response :success
end

test 'should get show' do
    get :show, id:@clientes.id
    assert_response :success
end

test 'should get new' do
    get :new
    assert_response :success
end

test 'should create client' do
    assert_difference('Cliente.count') do
        post :create, :cliente => { :c_targeta_cliente => @clientes.c_targeta_cliente, :nombre => @clientes.nombre, :a_paterno => @clientes.a_paterno, :a_materno => @clientes.a_materno, :email => @clientes.email, :t_celular => @clientes.t_celular, :domicilio => @clientes.domicilio, :fecha_alta => @clientes.fecha_alta, :c_postal => @clientes.c_postal, :sexo => @clientes.sexo }
    end
    assert_equal 'Client was successfully created.', flash[:notice]
end

test 'should get edit' do
    get :edit, id:@clientes.id
    assert_response :success
end

test 'should get update' do
    patch :update, id:@clientes.id, :cliente => { :c_targeta_cliente => @clientes.c_targeta_cliente, :nombre => @clientes.nombre, :a_paterno => @clientes.a_paterno, :a_materno => @clientes.a_materno, :email => @clientes.email, :t_celular => @clientes.t_celular, :domicilio => @clientes.domicilio, :fecha_alta => @clientes.fecha_alta, :c_postal => @clientes.c_postal , :sexo => @clientes.sexo }
    assert_redirected_to @clientes
end

test 'should get destroy' do
    assert_difference('Cliente.count', -1) do
        delete :destroy, id:@clientes.id
    end
    assert_redirected_to clientes_path
end

private

def initialize_cliente
    @clientes = clientes(:one)
end
end