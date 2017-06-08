require 'test_helper'

class RegistosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registo = registos(:one)
  end

  test "should get index" do
    get registos_url
    assert_response :success
  end

  test "should get new" do
    get new_registo_url
    assert_response :success
  end

  test "should create registo" do
    assert_difference('Registo.count') do
      post registos_url, params: { registo: { email: @registo.email, nome_empresa: @registo.nome_empresa, nome_user: @registo.nome_user, telemovel: @registo.telemovel } }
    end

    assert_redirected_to registo_url(Registo.last)
  end

  test "should show registo" do
    get registo_url(@registo)
    assert_response :success
  end

  test "should get edit" do
    get edit_registo_url(@registo)
    assert_response :success
  end

  test "should update registo" do
    patch registo_url(@registo), params: { registo: { email: @registo.email, nome_empresa: @registo.nome_empresa, nome_user: @registo.nome_user, telemovel: @registo.telemovel } }
    assert_redirected_to registo_url(@registo)
  end

  test "should destroy registo" do
    assert_difference('Registo.count', -1) do
      delete registo_url(@registo)
    end

    assert_redirected_to registos_url
  end
end
