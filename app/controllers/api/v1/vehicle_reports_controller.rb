class Api::V1::VehicleReportsController < ApplicationController

    def show
        vehicle_id = params[:id]
        report = VehicleReportService.daily_report(vehicle_id)
        render json: report
     end
end
