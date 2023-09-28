class Admin::OrdersController < ApplicationController
    
     before_action :authenticate_admin!
    
     def index
  	  @orders = Order.all.page(params[:page]).per(10)
	end
    
     def show
       @order = Order.find(params[:id])
       @order_details = @order.order_details
     end
     
     

end
