require 'rails_helper'

RSpec.describe Order, :type => :model do
  include  TestDataSetup
  let!(:user) { create_user }
  let!(:products) { create_products }

  

  describe "#calculate_amount" do
    it "should calculate amount " do
      @order = user.current_order
      @order.update(line_items_attributes: [{product_id: products.first.id, quantity: 2}])
      expect(@order.amount.to_f).to be 204.to_f
    end
  end

end
