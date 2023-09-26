class OrderDetail < ApplicationRecord
    
    belongs_to :order
	belongs_to :item
	
	validates :item_id, :order_id, :amount, :price, presence: true
	
	validates :price, :amount, numericality: { only_integer: true }

end
