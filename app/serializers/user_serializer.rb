class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :username, :phone, :company_name, :password, :password_confirmation

  has_many :drivers
  has_many :vehicles
end
