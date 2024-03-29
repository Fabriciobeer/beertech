require 'test_helper'

class ReceitaControllerTest < ActionController::TestCase
  setup do
    @receitum = receita(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receita)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receitum" do
    assert_difference('Receitum.count') do
      post :create, receitum: { cliente_id: @receitum.cliente_id, itens_receita[]: @receitum.itens_receita[], nome_receita: @receitum.nome_receita, quantidade_usada[]: @receitum.quantidade_usada[], unidade_receita[]: @receitum.unidade_receita[] }
    end

    assert_redirected_to receitum_path(assigns(:receitum))
  end

  test "should show receitum" do
    get :show, id: @receitum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receitum
    assert_response :success
  end

  test "should update receitum" do
    patch :update, id: @receitum, receitum: { cliente_id: @receitum.cliente_id, itens_receita[]: @receitum.itens_receita[], nome_receita: @receitum.nome_receita, quantidade_usada[]: @receitum.quantidade_usada[], unidade_receita[]: @receitum.unidade_receita[] }
    assert_redirected_to receitum_path(assigns(:receitum))
  end

  test "should destroy receitum" do
    assert_difference('Receitum.count', -1) do
      delete :destroy, id: @receitum
    end

    assert_redirected_to receita_path
  end
end
