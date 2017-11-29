require 'test_helper'

class MateriaprimasControllerTest < ActionController::TestCase
  setup do
    @materiaprima = materiaprimas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materiaprimas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materiaprima" do
    assert_difference('Materiaprima.count') do
      post :create, materiaprima: { cliente_id: @materiaprima.cliente_id, item: @materiaprima.item, tamanho_pacote: @materiaprima.tamanho_pacote, unidades: @materiaprima.unidades }
    end

    assert_redirected_to materiaprima_path(assigns(:materiaprima))
  end

  test "should show materiaprima" do
    get :show, id: @materiaprima
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materiaprima
    assert_response :success
  end

  test "should update materiaprima" do
    patch :update, id: @materiaprima, materiaprima: { cliente_id: @materiaprima.cliente_id, item: @materiaprima.item, tamanho_pacote: @materiaprima.tamanho_pacote, unidades: @materiaprima.unidades }
    assert_redirected_to materiaprima_path(assigns(:materiaprima))
  end

  test "should destroy materiaprima" do
    assert_difference('Materiaprima.count', -1) do
      delete :destroy, id: @materiaprima
    end

    assert_redirected_to materiaprimas_path
  end
end
