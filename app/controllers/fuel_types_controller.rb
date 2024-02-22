class FuelTypesController < ApplicationController
  before_action :set_fuel_type, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /fuel_types
  def index
    @fuel_types = FuelType.all

    render json: @fuel_types
  end

  # GET /fuel_types/1
  def show
    render json: @fuel_type
  end

  # POST /fuel_types
  def create
    @fuel_type = FuelType.create(fuel_type_params)

    if @fuel_type.save
      render json: @fuel_type, status: :created, location: @fuel_type
    else
      render json: @fuel_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fuel_types/1
  def update
    if @fuel_type.update(fuel_type_params)
      render json: @fuel_type
    else
      render json: @fuel_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fuel_types/1
  def destroy
    @fuel_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def render_not_found_response
      render json: { error: "Fuel type not found" }, status: :not_found
    end

    def set_fuel_type
      @fuel_type = FuelType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fuel_type_params
      params.require(:fuel_type).permit(:fuel_type_name)
    end
end
