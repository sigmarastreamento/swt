require 'test_helper'

class ApplicationSettingsControllerTest < ActionController::TestCase
  setup do
    @application_setting = application_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_setting" do
    assert_difference('ApplicationSetting.count') do
      post :create, application_setting: {  }
    end

    assert_redirected_to application_setting_path(assigns(:application_setting))
  end

  test "should show application_setting" do
    get :show, id: @application_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_setting
    assert_response :success
  end

  test "should update application_setting" do
    patch :update, id: @application_setting, application_setting: {  }
    assert_redirected_to application_setting_path(assigns(:application_setting))
  end

  test "should destroy application_setting" do
    assert_difference('ApplicationSetting.count', -1) do
      delete :destroy, id: @application_setting
    end

    assert_redirected_to application_settings_path
  end
end
