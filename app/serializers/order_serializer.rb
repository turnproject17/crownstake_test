class OrderSerializer < ActiveModel::Serializer
  attributes :id, :number, :amount, :state, :placed_at, :created_at

  has_many :line_items
end
