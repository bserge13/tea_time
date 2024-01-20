class Api::V0::TeasController < ApplicationController
  before_action :set_tea, only: %i[ show update destroy ]

  # GET /api/v0/teas
  def index
    @teas = Tea.all

    render json: @teas
  end

  # GET /api/v0/teas/1
  def show
    render json: @tea
  end

  # POST /api/v0/teas
  def create
    @tea = Tea.new(tea_params)

    if @tea.save
      render json: @tea, status: :created, location: @tea
    else
      render json: @tea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v0/teas/1
  def update
    if @tea.update(tea_params)
      render json: @tea
    else
      render json: @tea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v0/teas/1
  def destroy
    @tea.destroy!
  end

  private

  def set_tea
      @tea = Tea.find(params[:id])
    end

    def tea_params
      params.fetch(:tea, {})
    end
end
