class FuelStationsController < ApplicationController
  before_action :set_fuel_station, only: %i[ show update destroy ]

  # GET /fuel_stations
  def index
    @fuel_stations = FuelStation.all

    render json: @fuel_stations
  end

  # GET /fuel_stations/1
  def show
    render json: @fuel_station
  end

  # POST /fuel_stations
  def create
    @fuel_station = FuelStation.new(fuel_station_params)

    if @fuel_station.save
      render json: @fuel_station, status: :created, location: @fuel_station
    else
      render json: @fuel_station.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fuel_stations/1
  def update
    if @fuel_station.update(fuel_station_params)
      render json: @fuel_station
    else
      render json: @fuel_station.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fuel_stations/1
  def destroy
    @fuel_station.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel_station
      @fuel_station = FuelStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fuel_station_params
      params.require(:fuel_station).permit(:station_name, :station_code, :contact_name, :contact_phone)
    end
end
