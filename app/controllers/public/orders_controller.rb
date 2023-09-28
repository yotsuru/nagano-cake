class Public::OrdersController < ApplicationController
    
    before_action :authenticate_customer!
    
    def new
  	  @order = Order.new
    end
    
    def confirm
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
    
    def create
      @order = current_customer.orders.new(order_params)
      @order.save
      flash[:notice] = "ご注文が確定しました。"
      redirect_to public_orders_complete_path

    end
    
    def complete
	  end

    def show
	    @order = Order.find(params[:id])
      @order_details = @order.order_details
    end

 


private
def order_params
 
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 
end

end
