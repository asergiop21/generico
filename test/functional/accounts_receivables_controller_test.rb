require 'test_helper'

class AccountsReceivablesControllerTest < ActionController::TestCase
  setup do
    @accounts_receivable = accounts_receivables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts_receivables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounts_receivable" do
    assert_difference('AccountsReceivable.count') do
      post :create, accounts_receivable: { amount: @accounts_receivable.amount, customer_id: @accounts_receivable.customer_id, description: @accounts_receivable.description, number_invoice: @accounts_receivable.number_invoice, user_id: @accounts_receivable.user_id }
    end

    assert_redirected_to accounts_receivable_path(assigns(:accounts_receivable))
  end

  test "should show accounts_receivable" do
    get :show, id: @accounts_receivable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounts_receivable
    assert_response :success
  end

  test "should update accounts_receivable" do
    put :update, id: @accounts_receivable, accounts_receivable: { amount: @accounts_receivable.amount, customer_id: @accounts_receivable.customer_id, description: @accounts_receivable.description, number_invoice: @accounts_receivable.number_invoice, user_id: @accounts_receivable.user_id }
    assert_redirected_to accounts_receivable_path(assigns(:accounts_receivable))
  end

  test "should destroy accounts_receivable" do
    assert_difference('AccountsReceivable.count', -1) do
      delete :destroy, id: @accounts_receivable
    end

    assert_redirected_to accounts_receivables_path
  end
end
