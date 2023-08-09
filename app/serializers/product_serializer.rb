# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :description, :price, :image, :instock, :stock_count
  has_many :reviews
end
