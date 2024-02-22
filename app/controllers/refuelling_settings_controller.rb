class RefuellingSettingsController < ApplicationController
  before_action :set_refuelling_setting, only: %i[ show update destroy ]

  # GET /refuelling_settings
  def index
    @refuelling_settings = RefuellingSetting.all

    render json: @refuelling_settings
  end

  # GET /refuelling_settings/1
  def show
    render json: @refuelling_setting
  end

  # POST /refuelling_settings
  def create
    @refuelling_setting = RefuellingSetting.new(refuelling_setting_params)

    if @refuelling_setting.save
      render json: @refuelling_setting, status: :created, location: @refuelling_setting
    else
      render json: @refuelling_setting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /refuelling_settings/1
  def update
    if @refuelling_setting.update(refuelling_setting_params)
      render json: @refuelling_setting
    else
      render json: @refuelling_setting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /refuelling_settings/1
  def destroy
    @refuelling_setting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refuelling_setting
      @refuelling_setting = RefuellingSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def refuelling_setting_params
      params.require(:refuelling_setting).permit(:fuel_amount, :odometer_reading_at_refuelling, :fuel_entry_date, :units_taken, :refuel_place, :vehicle_id, :fuel_type_id, :fuel_station_id)
    end
end
