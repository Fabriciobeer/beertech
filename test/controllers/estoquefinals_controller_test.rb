require 'test_helper'

class EstoquefinalsControllerTest < ActionController::TestCase
  setup do
    @estoquefinal = estoquefinals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estoquefinals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estoquefinal" do
    assert_difference('Estoquefinal.count') do
      post :create, estoquefinal: { destino: @estoquefinal.destino, id_cervejaria: @estoquefinal.id_cervejaria, id_item: @estoquefinal.id_item, quantidade_atual: @estoquefinal.quantidade_atual }
    end

    assert_redirected_to estoquefinal_path(assigns(:estoquefinal))
  end

  test "should show estoquefinal" do
    get :show, id: @estoquefinal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estoquefinal
    assert_response :success
  end

  test "should update estoquefinal" do
    patch :update, id: @estoquefinal, estoquefinal: { destino: @estoquefinal.destino, id_cervejaria: @estoquefinal.id_cervejaria, id_item: @estoquefinal.id_item, quantidade_atual: @estoquefinal.quantidade_atual }
    assert_redirected_to estoquefinal_path(assigns(:estoquefinal))
  end

  test "should destroy estoquefinal" do
    assert_difference('Estoquefinal.count', -1) do
      delete :destroy, id: @estoquefinal
    end

    assert_redirected_to estoquefinals_path
  end
end
