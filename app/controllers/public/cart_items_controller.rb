class Public::CartItemsController < ApplicationController
    
    before_action :authenticate_customer!

    def index
     @cart_items = current_customer.cart_items.all
     @sum = 0
    end
    
    def update
     @cart_item = CartItem.find(params[:id])
     @cart_item.update(amount: params[:cart_item][:amount].to_i)
     redirect_to public_cart_items_path
    end

    def create
     @cart_item = current_customer.cart_items.new(cart_item_params)
     if CartItem.find_by(item_id: @cart_item.item_id)
       cart_item = CartItem.find_by(item_id: @cart_item.item_id)
       @amount = cart_item.amount+ @cart_item.amount
       cart_item.update_attribute(:amount, @amount)
       @cart_item.delete
     end
       @cart_item.save
       redirect_to public_cart_items_path
     
    end

    def destroy
     current_customer.cart_items.find(params[:id]).destroy
     redirect_to public_cart_items_path
    end

    def destroy_all
     current_customer.cart_items.destroy_all
     redirect_to public_cart_items_path
    end


private
 
 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
 end
end
