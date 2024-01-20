class Api::V0::CustomerSubscriptionsController < ApplicationController
  # before_action :set_customer_subscription, only: %i[ show update destroy ]

  # GET /api/v0/customer_subscriptions
  def index
    @customer_subscriptions = CustomerSubscription.all

    render json: @customer_subscriptions
  end

  # GET /api/v0/customer_subscriptions/1
  def show
    render json: @customer_subscription
  end

  # POST /api/v0/customer_subscriptions
  def create
    @customer_subscription = CustomerSubscription.new(customer_subscription_params)
    if @customer_subscription.save
      render json: CustomerSubscriptionSerializer.new(@customer_subscription), status: :created
    else
      render json: @customer_subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v0/customer_subscriptions/1
  def update
    if @customer_subscription.update(customer_subscription_params)
      render json: @customer_subscription
    else
      render json: @customer_subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v0/customer_subscriptions/1
  def destroy
    @customer_subscription.destroy!
  end

  private

    def set_customer_subscription
      @customer_subscription = CustomerSubscription.find(params[:id])
    end

    def customer_subscription_params
      params.require(:customer_subscription).permit(:customer_id, :subscription_id)
    end
end
