require 'test_helper'

class UsersDevicesControllerTest < ActionController::TestCase
  setup do
    @users_device = users_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_device" do
    assert_difference('UsersDevice.count') do
      post :create, users_device: {  }
    end

    assert_redirected_to users_device_path(assigns(:users_device))
  end

  test "should show users_device" do
    get :show, id: @users_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_device
    assert_response :success
  end

  test "should update users_device" do
    patch :update, id: @users_device, users_device: {  }
    assert_redirected_to users_device_path(assigns(:users_device))
  end

  test "should destroy users_device" do
    assert_difference('UsersDevice.count', -1) do
      delete :destroy, id: @users_device
    end

    assert_redirected_to users_devices_path
  end
end
