# frozen_string_literal: true

class OrderDetailSerializer < ActiveModel::Serializer
  attributes :quantity
  has_one :order
  has_one :product
end
