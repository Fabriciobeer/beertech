require 'test_helper'

class CiclovidasControllerTest < ActionController::TestCase
  setup do
    @ciclovida = ciclovidas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ciclovidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ciclovida" do
    assert_difference('Ciclovida.count') do
      post :create, ciclovida: { id_cervejaria: @ciclovida.id_cervejaria, id_item: @ciclovida.id_item, localizacao: @ciclovida.localizacao }
    end

    assert_redirected_to ciclovida_path(assigns(:ciclovida))
  end

  test "should show ciclovida" do
    get :show, id: @ciclovida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ciclovida
    assert_response :success
  end

  test "should update ciclovida" do
    patch :update, id: @ciclovida, ciclovida: { id_cervejaria: @ciclovida.id_cervejaria, id_item: @ciclovida.id_item, localizacao: @ciclovida.localizacao }
    assert_redirected_to ciclovida_path(assigns(:ciclovida))
  end

  test "should destroy ciclovida" do
    assert_difference('Ciclovida.count', -1) do
      delete :destroy, id: @ciclovida
    end

    assert_redirected_to ciclovidas_path
  end
end
