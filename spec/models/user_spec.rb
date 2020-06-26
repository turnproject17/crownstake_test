require 'rails_helper'

RSpec.describe Order, :type => :model do
  include  TestDataSetup
  let!(:user) { create_user }
  

  describe "#current_order" do
    it "should return the active order" do
      @order = user.current_order
      expect(@order.present?).to be true
      expect(@order.active?).to be true
    end
  end
end

