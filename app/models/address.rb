class Address < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, presence:true
  validates :address, presence:true
  validates :ship_to_name, presence:true
end
