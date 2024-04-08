class DriversController < ApplicationController
  before_action :set_driver, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  # GET /drivers
  def index
  
 
    user_id = params[:user_id]
    @drivers = Driver.where(user_id: user_id)
    # @drivers = Driver.all
    render json: @drivers
  end

  # GET /drivers/1
  def show
    render json: @driver
  end

  # POST /drivers
  def create
    @driver = Driver.create(driver_params)

    if @driver.save
      render json: @driver, status: :created, location: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end

  #   if params[:image].present?
  #     @driver.image.attach(params[:image])
  # end
  end

  # PATCH/PUT /drivers/1
  def update
    if @driver.update(driver_params)
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drivers/1
  def destroy
    @driver.destroy
  end

  # def profile
  #   @driver = Driver.last.to_json(include: [:image])
  #   render json: @driver
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def render_not_found_response
      render json: { error: "Driver not found" }, status: :not_found
    end

    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.permit(:driver_name, :email, :mobile, :national_id, :license_no, :license_type, :license_issue_date, :date_of_birth, :address, :joining_date, :user_id)
    end
end
