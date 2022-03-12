class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :family_name, presence:true 
  validates :first_name, presence:true
  validates :family_name_kana, presence:true
  validates :first_name_kana, presence:true
  validates :email, presence:true, uniqueness:true
  validates :postal_code, presence:true
  validates :address, presence:true
  validates :phone_number, presence:true
end
