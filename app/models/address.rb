class Address < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, presence:true
  validates :address, presence:true
  validates :ship_to_name, presence:true
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + ship_to_name
  end
end
