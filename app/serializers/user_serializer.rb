class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :authentication_token
end