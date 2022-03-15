class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {payment_wait: 0, payment_confirm: 1, creating: 2, delivery_preparation: 3, delivered: 4}
  
  validates :ship_to_postal_code, presence: true
  validates :ship_to_address, presence: true
  validates :ship_to_name, presence: true
  validates :ship_fee, presence: true
  validates :total_price, presence: true
  validates :payment_method, presence: true
  validates :order_status, presence: true
  
  def total(cart_items)
    item_total_price = 0
    cart_items.each do |cart_item|
      item_total_price  += cart_item.subtotal
    end
    return item_total_price + ship_fee
  end
  
  def address_display
    '〒' + ship_to_postal_code + ' ' + ship_to_address + ' ' + ship_to_name
  end
  
  def total_amount
    amount = 0
    order_details.each do |order_detail|
      amount += order_detail.amount
    end
    return amount
    
  end
end
