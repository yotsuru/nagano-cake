class Public::CartItemsController < ApplicationController
    
    before_action :authenticate_customer!

    def index
     @cart_items = current_cart
    end
    
    def update
     @cart_item.update(amount: params[:cart_item][:amount].to_i)
     @price = sub_price(@cart_item).to_s(:delimited)
     @cart_items = current_cart
     @total = total_price(@cart_items).to_s(:delimited)
    end




private
 
 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
 end
end
