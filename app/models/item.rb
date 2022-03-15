class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  validates :name, presence:true
  validates :image, presence:true
  validates :introduction, presence:true
  validates :tax_excluded_price, presence:true
  
  # 消費税を求めるメソッド
  def with_tax_price
    (tax_excluded_price * 1.1).floor
  end
  
  def self.search(keyword)
    where(["name like ?", "%#{keyword}%"])
  end
end
