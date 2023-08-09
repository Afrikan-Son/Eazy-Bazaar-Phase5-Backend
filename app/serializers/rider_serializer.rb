# frozen_string_literal: true

class RiderSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number
end
