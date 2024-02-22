class VehicleTypesController < ApplicationController
  before_action :set_vehicle_type, only: %i[ show update destroy ]

  # GET /vehicle_types
  def index
    @vehicle_types = VehicleType.all

    render json: @vehicle_types
  end

  # GET /vehicle_types/1
  def show
    render json: @vehicle_type
  end

  # POST /vehicle_types
  def create
    @vehicle_type = VehicleType.new(vehicle_type_params)

    if @vehicle_type.save
      render json: @vehicle_type, status: :created, location: @vehicle_type
    else
      render json: @vehicle_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_types/1
  def update
    if @vehicle_type.update(vehicle_type_params)
      render json: @vehicle_type
    else
      render json: @vehicle_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_types/1
  def destroy
    @vehicle_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_type
      @vehicle_type = VehicleType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_type_params
      params.require(:vehicle_type).permit(:vehicle_type_name)
    end
end
