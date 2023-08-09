class OrderDetailSerializer < ActiveModel::Serializer
  attributes  :quantity,:order_id,:product_id
end
