require 'test_helper'

class TiposDeDescontosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_de_desconto = tipos_de_descontos(:one)
  end

  test "should get index" do
    get tipos_de_descontos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_de_desconto_url
    assert_response :success
  end

  test "should create tipo_de_desconto" do
    assert_difference('TipoDeDesconto.count') do
      post tipos_de_descontos_url, params: { tipo_de_desconto: { empresa_id: @tipo_de_desconto.empresa_id, motivo: @tipo_de_desconto.motivo, natureza: @tipo_de_desconto.natureza, nome: @tipo_de_desconto.nome, percentagem: @tipo_de_desconto.percentagem } }
    end

    assert_redirected_to tipo_de_desconto_url(TipoDeDesconto.last)
  end

  test "should show tipo_de_desconto" do
    get tipo_de_desconto_url(@tipo_de_desconto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_de_desconto_url(@tipo_de_desconto)
    assert_response :success
  end

  test "should update tipo_de_desconto" do
    patch tipo_de_desconto_url(@tipo_de_desconto), params: { tipo_de_desconto: { empresa_id: @tipo_de_desconto.empresa_id, motivo: @tipo_de_desconto.motivo, natureza: @tipo_de_desconto.natureza, nome: @tipo_de_desconto.nome, percentagem: @tipo_de_desconto.percentagem } }
    assert_redirected_to tipo_de_desconto_url(@tipo_de_desconto)
  end

  test "should destroy tipo_de_desconto" do
    assert_difference('TipoDeDesconto.count', -1) do
      delete tipo_de_desconto_url(@tipo_de_desconto)
    end

    assert_redirected_to tipos_de_descontos_url
  end
end
