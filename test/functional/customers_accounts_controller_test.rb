require 'test_helper'

class CustomersAccountsControllerTest < ActionController::TestCase
  setup do
    @customers_account = customers_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customers_account" do
    assert_difference('CustomersAccount.count') do
      post :create, customers_account: { amount_depostied: @customers_account.amount_depostied, current_balance: @customers_account.current_balance, customer_id: @customers_account.customer_id, debt: @customers_account.debt }
    end

    assert_redirected_to customers_account_path(assigns(:customers_account))
  end

  test "should show customers_account" do
    get :show, id: @customers_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customers_account
    assert_response :success
  end

  test "should update customers_account" do
    put :update, id: @customers_account, customers_account: { amount_depostied: @customers_account.amount_depostied, current_balance: @customers_account.current_balance, customer_id: @customers_account.customer_id, debt: @customers_account.debt }
    assert_redirected_to customers_account_path(assigns(:customers_account))
  end

  test "should destroy customers_account" do
    assert_difference('CustomersAccount.count', -1) do
      delete :destroy, id: @customers_account
    end

    assert_redirected_to customers_accounts_path
  end
end
