require 'test_helper'

class RadiatorsControllerTest < ActionController::TestCase
  setup do
    @radiator = radiators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:radiators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create radiator" do
    assert_difference('Radiator.count') do
      post :create, radiator: {  }
    end

    assert_redirected_to radiator_path(assigns(:radiator))
  end

  test "should show radiator" do
    get :show, id: @radiator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @radiator
    assert_response :success
  end

  test "should update radiator" do
    patch :update, id: @radiator, radiator: {  }
    assert_redirected_to radiator_path(assigns(:radiator))
  end

  test "should destroy radiator" do
    assert_difference('Radiator.count', -1) do
      delete :destroy, id: @radiator
    end

    assert_redirected_to radiators_path
  end
end
