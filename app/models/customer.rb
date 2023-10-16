class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :orders
  
  
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, 
            :postal_code, :address, :telephone_number,
            presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  
  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == true)
  end
end
