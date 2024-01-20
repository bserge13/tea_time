class Api::V0::SubscriptionTeasController < ApplicationController
  before_action :set_subscription_tea, only: %i[ show update destroy ]

  # GET /subscription_teas
  def index
    @subscription_teas = SubscriptionTea.all

    render json: @subscription_teas
  end

  # GET /subscription_teas/1
  def show
    render json: @subscription_tea
  end

  # POST /subscription_teas
  def create
    @subscription_tea = SubscriptionTea.new(subscription_tea_params)

    if @subscription_tea.save
      render json: @subscription_tea, status: :created, location: @subscription_tea
    else
      render json: @subscription_tea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscription_teas/1
  def update
    if @subscription_tea.update(subscription_tea_params)
      render json: @subscription_tea
    else
      render json: @subscription_tea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscription_teas/1
  def destroy
    @subscription_tea.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_tea
      @subscription_tea = SubscriptionTea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_tea_params
      params.require(:subscription_tea).permit(:tea_id, :subscription_id)
    end
end
