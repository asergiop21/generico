require 'test_helper'

class PlansControllerTest < ActionController::TestCase
  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post :create, plan: { download_speed: @plan.download_speed, integer: @plan.integer, name: @plan.name, price: @plan.price, price_surcharges1: @plan.price_surcharges1, proce_sircharges2: @plan.proce_sircharges2, remove: @plan.remove, upload_speed: @plan.upload_speed }
    end

    assert_redirected_to plan_path(assigns(:plan))
  end

  test "should show plan" do
    get :show, id: @plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan
    assert_response :success
  end

  test "should update plan" do
    put :update, id: @plan, plan: { download_speed: @plan.download_speed, integer: @plan.integer, name: @plan.name, price: @plan.price, price_surcharges1: @plan.price_surcharges1, proce_sircharges2: @plan.proce_sircharges2, remove: @plan.remove, upload_speed: @plan.upload_speed }
    assert_redirected_to plan_path(assigns(:plan))
  end

  test "should destroy plan" do
    assert_difference('Plan.count', -1) do
      delete :destroy, id: @plan
    end

    assert_redirected_to plans_path
  end
end
