require 'test_helper'

class ItemFacturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_factura = item_facturas(:one)
  end

  test "should get index" do
    get item_facturas_url
    assert_response :success
  end

  test "should get new" do
    get new_item_factura_url
    assert_response :success
  end

  test "should create item_factura" do
    assert_difference('ItemFactura.count') do
      post item_facturas_url, params: { item_factura: { codigo: @item_factura.codigo, descricao: @item_factura.descricao, factura_id: @item_factura.factura_id, preco_total: @item_factura.preco_total, preco_unitario: @item_factura.preco_unitario, quantidade: @item_factura.quantidade } }
    end

    assert_redirected_to item_factura_url(ItemFactura.last)
  end

  test "should show item_factura" do
    get item_factura_url(@item_factura)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_factura_url(@item_factura)
    assert_response :success
  end

  test "should update item_factura" do
    patch item_factura_url(@item_factura), params: { item_factura: { codigo: @item_factura.codigo, descricao: @item_factura.descricao, factura_id: @item_factura.factura_id, preco_total: @item_factura.preco_total, preco_unitario: @item_factura.preco_unitario, quantidade: @item_factura.quantidade } }
    assert_redirected_to item_factura_url(@item_factura)
  end

  test "should destroy item_factura" do
    assert_difference('ItemFactura.count', -1) do
      delete item_factura_url(@item_factura)
    end

    assert_redirected_to item_facturas_url
  end
end
