require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post :create, loan: { comment: @loan.comment, confirmation_loan: @loan.confirmation_loan, customer_id: @loan.customer_id, equipoment_id: @loan.equipoment_id, status_loan: @loan.status_loan, technical_id: @loan.technical_id, user_id: @loan.user_id }
    end

    assert_redirected_to loan_path(assigns(:loan))
  end

  test "should show loan" do
    get :show, id: @loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan
    assert_response :success
  end

  test "should update loan" do
    put :update, id: @loan, loan: { comment: @loan.comment, confirmation_loan: @loan.confirmation_loan, customer_id: @loan.customer_id, equipoment_id: @loan.equipoment_id, status_loan: @loan.status_loan, technical_id: @loan.technical_id, user_id: @loan.user_id }
    assert_redirected_to loan_path(assigns(:loan))
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete :destroy, id: @loan
    end

    assert_redirected_to loans_path
  end
end
