class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  validates :name, presence:true
  validates :image, presence:true
  validates :introduction, presence:true
  validates :tax_excluded_price, presence:true
  validates :is_sale, presence:true
end
