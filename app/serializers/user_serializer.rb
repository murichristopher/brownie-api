class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :coins
end
