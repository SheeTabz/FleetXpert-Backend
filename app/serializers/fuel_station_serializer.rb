class FuelStationSerializer < ActiveModel::Serializer
  attributes :id, :station_name, :station_code, :contact_name, :contact_phone
end
