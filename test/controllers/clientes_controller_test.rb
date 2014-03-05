require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  def setup
    @clientes=clientes(:one)
  end



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

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should create post" do
    assert_difference('Cliente.count') do
    cliente :create, cliente: {nombre: 'ana laura'}
  end
 
  assert_redirected_to post_path(assigns(:cliente))
end

  test "should get edit" do
    get :edit, id:@clientes.id
    assert_response :success
  end

  test "should get update" do
    patch :update, id:@clientes.id, clientes:{}
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should get destroy" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id:@clientes.id
    end
    assert_redirected_to cliente_path
  end

end
