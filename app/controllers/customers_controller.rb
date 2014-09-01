class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json

		  require 'will_paginate/array'
		  before_filter :authenticate_user!, :except => [:some_action_without_auth]
load_and_authorize_resource :only =>[:show]

def find

    #@invoices = Invoice.find_by_customer_id(params[:id])
    @invoices = Invoice.invoices(params[:id])

      @payments = 0
      @invoices.each do |e|
         if e.cancelar_invoice == false
            @payments  += Payment.where('invoice_id = ?', e.id).sum(&:amount)
         end
      end

      @amount = Invoice.total_amount(params[:id]) 
      @total = @payments - @amount
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoices }
    end
end


def index
  @customers = Customer.all
   @customers = Customer.con_nombre(params[:q]) if params[:q].present?
   @customers = Customer.con_id(params[:customer_id]) if params[:customer_id].present?
  @customers = @customers.paginate(page: params[:page], per_page: 10)

  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customers }
    end
  end

def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
  1.times {@customer.phones.build}    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
#    unauthorized! if cannot? :edit, @customer
  end

  # POST /customers
  # POST /customers.json
  def create
    #@customer = Customer.new(params[:customer].merge(:user_id => current_user.id))
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
end
