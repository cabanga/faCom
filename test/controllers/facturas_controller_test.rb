require 'test_helper'

class FacturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factura = facturas(:one)
  end

  test "should get index" do
    get facturas_url
    assert_response :success
  end

  test "should get new" do
    get new_factura_url
    assert_response :success
  end

  test "should create factura" do
    assert_difference('Factura.count') do
      post facturas_url, params: { factura: { cliente: @factura.cliente, contacto: @factura.contacto, empresa_id: @factura.empresa_id, referencia: @factura.referencia, responsavel: @factura.responsavel, tipo_de_servico: @factura.tipo_de_servico } }
    end

    assert_redirected_to factura_url(Factura.last)
  end

  test "should show factura" do
    get factura_url(@factura)
    assert_response :success
  end

  test "should get edit" do
    get edit_factura_url(@factura)
    assert_response :success
  end

  test "should update factura" do
    patch factura_url(@factura), params: { factura: { cliente: @factura.cliente, contacto: @factura.contacto, empresa_id: @factura.empresa_id, referencia: @factura.referencia, responsavel: @factura.responsavel, tipo_de_servico: @factura.tipo_de_servico } }
    assert_redirected_to factura_url(@factura)
  end

  test "should destroy factura" do
    assert_difference('Factura.count', -1) do
      delete factura_url(@factura)
    end

    assert_redirected_to facturas_url
  end
end
