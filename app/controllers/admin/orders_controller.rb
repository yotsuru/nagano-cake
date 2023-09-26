class Admin::OrdersController < ApplicationController
    
     before_action :authenticate_admin!
    
     def show
       @order = Order.find(params[:id])
     end
     
     def index
  	   @orders = Order.all.page(params[:page]).per(3)
  	 end

end
