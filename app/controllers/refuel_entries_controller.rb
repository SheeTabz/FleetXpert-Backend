class RefuelEntriesController < ApplicationController
  before_action :set_refuel_entry, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /refuel_entries
  def index
    @refuel_entries = RefuelEntry.all

    render json: @refuel_entries
  end

  # GET /refuel_entries/1
  def show
    render json: @refuel_entry
  end

  # POST /refuel_entries
  def create
    @refuel_entry = RefuelEntry.create(refuel_entry_params)

    if @refuel_entry.save
      render json: @refuel_entry, status: :created, location: @refuel_entry
    else
      render json: @refuel_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /refuel_entries/1
  def update
    if @refuel_entry.update(refuel_entry_params)
      render json: @refuel_entry
    else
      render json: @refuel_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /refuel_entries/1
  def destroy
    @refuel_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def render_not_found_response
      render json: { error: "Fuel entry not found" }, status: :not_found
    end

    def set_refuel_entry
      @refuel_entry = RefuelEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def refuel_entry_params
      params.require(:refuel_entry).permit(:fuel_amount, :odometer_reading_at_refuelling, :fuel_entry_date, :units_taken, :refuel_place, :vehicle_id, :fuel_type_id, :fuel_station_id)
    end
end
