class VehicleTripsController < ApplicationController
  before_action :set_vehicle_trip, only: %i[ show update destroy ]

  # GET /vehicle_trips
  def index
    @vehicle_trips = VehicleTrip.all

    render json: @vehicle_trips
  end

  # GET /vehicle_trips/1
  def show
    render json: @vehicle_trip
  end

  # POST /vehicle_trips
  def create
    @vehicle_trip = VehicleTrip.new(vehicle_trip_params)

    if @vehicle_trip.save
      render json: @vehicle_trip, status: :created, location: @vehicle_trip
    else
      render json: @vehicle_trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_trips/1
  def update
    if @vehicle_trip.update(vehicle_trip_params)
      render json: @vehicle_trip
    else
      render json: @vehicle_trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_trips/1
  def destroy
    @vehicle_trip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_trip
      @vehicle_trip = VehicleTrip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_trip_params
      params.require(:vehicle_trip).permit(:no_of_trips, :start_Time, :end_time, :trip_date, :amount_earned, :vehicle_id)
    end
end
