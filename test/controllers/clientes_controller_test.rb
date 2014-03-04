require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => message.to_param
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create, :id => 1
    assert_response :notice => "Cliente guardado"
  end

  test "should get edit" do
    get :edit, :id => message.to_param
    assert_response :success
  end

  test "should get update" do
    get :update, :id => message.to_param
    assert_response :notice => "El registro cliente se ha actualizado"
  end

  test "should get destroy" do
    get :destroy, :id => message.to_param
    assert_response :notice => "El registro cliente se ha borrado"
  end

end
