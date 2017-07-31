require 'test_helper'

class TiposDeImpostosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_de_imposto = tipos_de_impostos(:one)
  end

  test "should get index" do
    get tipos_de_impostos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_de_imposto_url
    assert_response :success
  end

  test "should create tipo_de_imposto" do
    assert_difference('TipoDeImposto.count') do
      post tipos_de_impostos_url, params: { tipo_de_imposto: { empresa_id: @tipo_de_imposto.empresa_id, motivo: @tipo_de_imposto.motivo, percentagem: @tipo_de_imposto.percentagem, tipo: @tipo_de_imposto.tipo, valor: @tipo_de_imposto.valor } }
    end

    assert_redirected_to tipo_de_imposto_url(TipoDeImposto.last)
  end

  test "should show tipo_de_imposto" do
    get tipo_de_imposto_url(@tipo_de_imposto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_de_imposto_url(@tipo_de_imposto)
    assert_response :success
  end

  test "should update tipo_de_imposto" do
    patch tipo_de_imposto_url(@tipo_de_imposto), params: { tipo_de_imposto: { empresa_id: @tipo_de_imposto.empresa_id, motivo: @tipo_de_imposto.motivo, percentagem: @tipo_de_imposto.percentagem, tipo: @tipo_de_imposto.tipo, valor: @tipo_de_imposto.valor } }
    assert_redirected_to tipo_de_imposto_url(@tipo_de_imposto)
  end

  test "should destroy tipo_de_imposto" do
    assert_difference('TipoDeImposto.count', -1) do
      delete tipo_de_imposto_url(@tipo_de_imposto)
    end

    assert_redirected_to tipos_de_impostos_url
  end
end
