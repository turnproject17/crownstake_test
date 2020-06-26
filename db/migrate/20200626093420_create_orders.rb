class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :number, null: false
      t.decimal :amount
      t.integer :state, default: 0
      t.datetime :placed_at

      t.timestamps
    end
  end
end
