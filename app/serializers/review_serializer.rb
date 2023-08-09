# frozen_string_literal: true

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :description, :rating
  has_one :user
  has_one :rider
  belongs_to :product
end
