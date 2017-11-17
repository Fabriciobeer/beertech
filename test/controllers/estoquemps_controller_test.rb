require 'test_helper'

class EstoquempsControllerTest < ActionController::TestCase
  setup do
    @estoquemp = estoquemps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estoquemps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estoquemp" do
    assert_difference('Estoquemp.count') do
      post :create, estoquemp: { destino: @estoquemp.destino, id_cervejaria: @estoquemp.id_cervejaria, item: @estoquemp.item, quantidade_atual: @estoquemp.quantidade_atual }
    end

    assert_redirected_to estoquemp_path(assigns(:estoquemp))
  end

  test "should show estoquemp" do
    get :show, id: @estoquemp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estoquemp
    assert_response :success
  end

  test "should update estoquemp" do
    patch :update, id: @estoquemp, estoquemp: { destino: @estoquemp.destino, id_cervejaria: @estoquemp.id_cervejaria, item: @estoquemp.item, quantidade_atual: @estoquemp.quantidade_atual }
    assert_redirected_to estoquemp_path(assigns(:estoquemp))
  end

  test "should destroy estoquemp" do
    assert_difference('Estoquemp.count', -1) do
      delete :destroy, id: @estoquemp
    end

    assert_redirected_to estoquemps_path
  end
end
