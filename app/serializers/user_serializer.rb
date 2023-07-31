class UserSerializer < ActiveModel::Serializer
   attributes :username, :avatar, :bio,:email,:contact_info
end
