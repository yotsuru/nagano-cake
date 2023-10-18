class Public::CartItemsController < ApplicationController
    
    before_action :authenticate_customer!

    def index
     @cart_items = current_customer.cart_items.all
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
     @cart_item.destroy
     @cart_items = current_cart
     redirect_to public_cart_items_path
    end

    def all_destroy
     @cart_items = current_customer.cart_items
     @cart_items.destroy_all
     #flash[:alert] = "カートの商品を全て削除しました"
     redirect_to public_cart_items_path
	   end


private
 
 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
 end
end
