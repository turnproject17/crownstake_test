class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :quantity, :amount
end
