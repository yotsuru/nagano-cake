class Order < ApplicationRecord
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :customer_id, :address, :name, :postage, :total_price, :payment_method,presence: true
	
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :postage, :total_price, numericality: { only_integer: true }

    
end
