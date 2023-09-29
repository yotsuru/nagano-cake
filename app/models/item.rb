class Item < ApplicationRecord
    has_many :order_details, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :orders, through: :order_details
    
    #attachment :image
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    
    def with_tax_price
     (price * 1.1).floor
    end
end
