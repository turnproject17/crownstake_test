class Order < ApplicationRecord
  enum state: %i{active placed delivered}
  scope :active,-> {where(state: "active")}

  belongs_to :user
  has_many :line_items
  
  before_create :make_number
  after_update :calculate_amount

  accepts_nested_attributes_for :line_items, allow_destroy: true

  def to_param
    number
  end

  def calculate_amount
    self.update_column(:amount, self.line_items.pluck(:amount).sum)
  end

  private 

  def make_number
    self.number = "CS" + SecureRandom.random_number(10**9).to_s(10).rjust(9, '0').upcase
  end
end
