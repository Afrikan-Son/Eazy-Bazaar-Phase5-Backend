# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :email, :contact_info, :is_admin, :created_at
  has_many :orders
end
