class VehicleAssignmentsController < ApplicationController
  before_action :set_vehicle_assignment, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  # GET /vehicle_assignments
  def index
    def index
      user_id = params[:user_id]
      @vehicle_assignments = VehicleAssignment.joins(:vehicle, :driver)
                                                .where('vehicles.user_id = ? OR drivers.user_id = ?', user_id, user_id)
     
      render json: @vehicle_assignments
     end
    # @vehicle_assignments = VehicleAssignment.all

    # render json: @vehicle_assignments
  end

   
  # GET /vehicle_assignments/1
  def show
    render json: @vehicle_assignment
  end

  # POST /vehicle_assignments
  def create

    @vehicle_assignment = VehicleAssignment.new(vehicle_assignment_params)

    if VehicleAssignment.where(vehicle_id: @vehicle_assignment.vehicle_id).exists?
       render json: { error: "The vehicle has already been assigned a driver." }, status: :unprocessable_entity
    elsif VehicleAssignment.where(driver_id: @vehicle_assignment.driver_id).exists?
       render json: { error: "The driver has already been assigned to another vehicle." }, status: :unprocessable_entity
    elsif @vehicle_assignment.save
       render json: @vehicle_assignment, status: :created, location: @vehicle_assignment
    else
       render json: @vehicle_assignment.errors, status: :unprocessable_entity
    end
    # @vehicle_assignment = VehicleAssignment.create(vehicle_assignment_params)

    # if @vehicle_assignment.save
    #   render json: @vehicle_assignment, status: :created, location: @vehicle_assignment
    # else
    #   render json: @vehicle_assignment.errors, status: :unprocessable_entity
    # end
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

    def render_not_found_response
      render json: { error: "Vehicle Assignment not found" }, status: :not_found
    end

    def set_vehicle_assignment
      @vehicle_assignment = VehicleAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_assignment_params
      params.require(:vehicle_assignment).permit(:start_date, :vehicle_id, :driver_id, :route_id)
    end
end
