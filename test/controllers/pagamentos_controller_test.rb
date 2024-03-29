require 'test_helper'

class PagamentosControllerTest < ActionController::TestCase
  setup do
    @pagamento = pagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pagamento" do
    assert_difference('Pagamento.count') do
      post :create, pagamento: { data_proximo_pagamento: @pagamento.data_proximo_pagamento, id_cervejaria: @pagamento.id_cervejaria, pagamento_realizado: @pagamento.pagamento_realizado, total_pagar: @pagamento.total_pagar }
    end

    assert_redirected_to pagamento_path(assigns(:pagamento))
  end

  test "should show pagamento" do
    get :show, id: @pagamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pagamento
    assert_response :success
  end

  test "should update pagamento" do
    patch :update, id: @pagamento, pagamento: { data_proximo_pagamento: @pagamento.data_proximo_pagamento, id_cervejaria: @pagamento.id_cervejaria, pagamento_realizado: @pagamento.pagamento_realizado, total_pagar: @pagamento.total_pagar }
    assert_redirected_to pagamento_path(assigns(:pagamento))
  end

  test "should destroy pagamento" do
    assert_difference('Pagamento.count', -1) do
      delete :destroy, id: @pagamento
    end

    assert_redirected_to pagamentos_path
  end
end
