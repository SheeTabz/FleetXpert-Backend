class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest

  has_many :drivers
  has_many :vehicles
end
