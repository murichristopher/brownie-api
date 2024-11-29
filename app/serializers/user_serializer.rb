class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :coins, :profile_picture
end
