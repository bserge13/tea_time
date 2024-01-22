class Api::V0::CustomerSubscriptionsController < ApplicationController
# POST /api/v0/customer_subscriptions
  def create
    @customer_subscription = CustomerSubscription.new(customer_subscription_params)
    if @customer_subscription.save
      @customer_subscription.subscription.update(status: :active)
      render json: CustomerSubscriptionSerializer.new(@customer_subscription), status: :created
    else
      render json: @customer_subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v0/customer_subscriptions/1
  # def update
  #   if @customer_subscription.update(customer_subscription_params)
  #     render json: @customer_subscription
  #   else
  #     render json: @customer_subscription.errors, status: :unprocessable_entity
  #   end
  # end

  def cancel_sub
    @customer_subscription = CustomerSubscription.find(params[:id])
    if @customer_subscription.customer.email == params[:email] && @customer_subscription.customer.authenticate(params[:password])
      @customer_subscription.subscription.update(status: :cancelled)
      render json: CustomerSubscriptionSerializer.new(@customer_subscription), status: :ok
    else
      render json: { error: "Sorry, your credentials are bad" }, status: :unauthorized
    end
  end

  private

    def customer_subscription_params
      params.require(:customer_subscription).permit(:customer_id, :subscription_id)
    end
end
