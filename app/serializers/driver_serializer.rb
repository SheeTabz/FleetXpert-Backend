class DriverSerializer < ActiveModel::Serializer
  attributes :id, :driver_name, :email, :mobile, :national_id, :license_no, :license_type, :license_issue_date, :date_of_birth, :address, :joining_date
  belongs_to :user
  has_one :vehicle_assignment


  def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
  hash = super
  hash.each { |key, value| hash.delete(key) if value.nil? }
  hash
end
end
