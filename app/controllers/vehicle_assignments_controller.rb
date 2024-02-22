class VehicleAssignmentsController < ApplicationController
  before_action :set_vehicle_assignment, only: %i[ show update destroy ]

  # GET /vehicle_assignments
  def index
    @vehicle_assignments = VehicleAssignment.all

    render json: @vehicle_assignments
  end

  # GET /vehicle_assignments/1
  def show
    render json: @vehicle_assignment
  end

  # POST /vehicle_assignments
  def create
    @vehicle_assignment = VehicleAssignment.new(vehicle_assignment_params)

    if @vehicle_assignment.save
      render json: @vehicle_assignment, status: :created, location: @vehicle_assignment
    else
      render json: @vehicle_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_assignments/1
  def update
    if @vehicle_assignment.update(vehicle_assignment_params)
      render json: @vehicle_assignment
    else
      render json: @vehicle_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_assignments/1
  def destroy
    @vehicle_assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_assignment
      @vehicle_assignment = VehicleAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_assignment_params
      params.require(:vehicle_assignment).permit(:start_date, :vehicle_id, :driver_id, :route_id)
    end
end
