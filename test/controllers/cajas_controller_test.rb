require 'test_helper'

class CajasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cajas_index_url
    assert_response :success
  end

  test "should get cobrar" do
    get cajas_cobrar_url
    assert_response :success
  end

end
