class Api::V0::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy ]

  # GET /api/v0/customers
  def index
    @customers = Customer.all

    render json: @customers
  end

  # GET /api/v0/customers/1
  def show
    render json: @customer
  end

  # POST /api/v0/customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v0/customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v0/customers/1
  def destroy
    @customer.destroy!
  end

  private
  
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.fetch(:customer, {})
    end
end
