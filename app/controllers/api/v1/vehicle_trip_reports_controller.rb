class Api::V1::VehicleTripReportsController < ApplicationController
    def show
        vehicle_id = params[:id]
        report = VehicleTripReportService.generate_report(vehicle_id)
        render json: report
     end
end
