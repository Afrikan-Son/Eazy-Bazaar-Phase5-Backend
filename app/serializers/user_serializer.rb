# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :bio, :email, :contact_info
  has_many :orders
end
