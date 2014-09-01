require 'test_helper'

class RolesAndPermissionsControllerTest < ActionController::TestCase
  setup do
    @roles_and_permission = roles_and_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles_and_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roles_and_permission" do
    assert_difference('RolesAndPermission.count') do
      post :create, roles_and_permission: { scope: @roles_and_permission.scope }
    end

    assert_redirected_to roles_and_permission_path(assigns(:roles_and_permission))
  end

  test "should show roles_and_permission" do
    get :show, id: @roles_and_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roles_and_permission
    assert_response :success
  end

  test "should update roles_and_permission" do
    put :update, id: @roles_and_permission, roles_and_permission: { scope: @roles_and_permission.scope }
    assert_redirected_to roles_and_permission_path(assigns(:roles_and_permission))
  end

  test "should destroy roles_and_permission" do
    assert_difference('RolesAndPermission.count', -1) do
      delete :destroy, id: @roles_and_permission
    end

    assert_redirected_to roles_and_permissions_path
  end
end
