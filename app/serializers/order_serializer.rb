class OrderSerializer < ActiveModel::Serializer
  attributes :id, :rider, :references, :total_amount, :date
  has_one :user
end
