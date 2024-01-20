class Api::V0::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[ show update destroy ]

  # GET /api/v0/subscriptions
  def index
    @subscriptions = Subscription.all

    render json: @subscriptions
  end

  # GET /api/v0/subscriptions/1
  def show
    render json: @subscription
  end

  # POST /api/v0/subscriptions
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      render json: @subscription, status: :created, location: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v0/subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v0/subscriptions/1
  def destroy
    @subscription.destroy!
  end

  private

    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.fetch(:subscription, {})
    end
end
