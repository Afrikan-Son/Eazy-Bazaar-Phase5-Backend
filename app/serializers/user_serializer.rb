# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :bio, :email, :contact_info, :is_admin
  has_many :orders
end
