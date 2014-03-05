require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  
  setup :initialize_cliente


  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id:@clientes.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Clientes.count') do
      cliente :create, clientes: {nombre: 'ana laura'} 
    end 
    assert_redirected_to clientes_path(assigns(:cliente))
  end

  test "should get edit" do
    get :edit, id:@clientes.id
    assert_response :success
  end

  test "should get update" do
    patch :update, id:@clientes.id, clientes:{}
    assert_redirected_to clientes_path(assigns(:cliente))
  end

  test "should get destroy" do
    assert_difference('Clientes.count', -1) do
      delete :destroy, id:@clientes.id
    end
    assert_redirected_to clientes_path
  end

  private
  def initialize_cliente
    @clientes=clientes(:one)
  end

end
