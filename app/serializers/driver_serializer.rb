class DriverSerializer < ActiveModel::Serializer
  attributes :id, :driver_name, :email, :mobile, :national_id, :license_no, :license_type, :license_issue_date, :date_of_birth, :address, :joining_date, :image
  belongs_to :user
end
