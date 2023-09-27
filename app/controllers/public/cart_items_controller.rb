class Public::CartItemsController < ApplicationController
    
    before_action :authenticate_customer!

    def index
     #@cart_items = current_customer.cart_items
     @cart_items = current_customer
    end
    
    def update
     @cart_item.update(amount: params[:cart_item][:amount].to_i)
     @cart_items = current_cart
    end

    def create
     @cart_item = current_cart.new(cart_item_params)
     @post_image.user_id = current_user.id
     @post_image.save
     redirect_to post_images_path
    end

    def destroy
     current_customer.cart_items.find(params[:id]).destroy
     redirect_to cart_items_path
    end

    def destroy_all
     current_customer.cart_items.destroy_all
     redirect_to cart_items_path
    end


private
 
 def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
 end
end
