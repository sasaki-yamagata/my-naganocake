class OrderDetail < ApplicationRecord
  enum make_status: {make_impossible: 0, make_wait: 1, making: 2, make_completed: 3}
  belongs_to :order
  belongs_to :item
  
  def with_tax_price
    (buy_price * 1.1).floor
  end
  
  def subtotal
     with_tax_price * amount
  end
end
