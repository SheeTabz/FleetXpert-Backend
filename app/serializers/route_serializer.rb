class RouteSerializer < ActiveModel::Serializer
  attributes :id, :to, :from
end
