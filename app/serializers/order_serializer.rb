class OrderSerializer < ActiveModel::Serializer
  attributes :id, :rider_id, :total_amount, :date,:created_at
  has_one :user
  has_many :order_details
end
