class Public::OrdersController < ApplicationController
    
    before_action :authenticate_customer!
    
    def index
      @orders = current_customer.orders.all
    end

    def new
  	  @order = Order.new
    end
    
    def confirm
      @cart_items = current_customer.cart_items.all
      @sum = 0
      @order = Order.new(order_params)
      @order.postage = 800
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.receiver = current_customer.last_name + current_customer.first_name
    end
    
    def create
      @order = current_customer.orders.new(order_params)
      # カートの商品を確定済みテーブルに移動させる
      #current_customer.cart_items.each do |cart_item|
      # ロジック
      @order.save!
      redirect_to complete_public_orders_path
      #end
      
    end
    
    def complete
    end

    def show
	    @order = Order.find(params[:id])
      @order_details = @order.order_details
    end


private
def order_params
 
  params.require(:order).permit(:payment_method, :postal_code, :address, :receiver, :total_price, :postage)
 
end
end
