class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :ship_to_postal_code, null: false
      t.string :ship_to_address, null: false
      t.string :ship_to_name, null: false
      t.integer :ship_fee, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
