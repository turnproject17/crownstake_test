class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  before_create :add_amount

  private

  def add_amount
    self.amount = self.product.price * self.quantity
  end
end
