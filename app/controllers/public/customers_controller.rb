class Public::CustomersController < ApplicationController
    
    def show
      @customer = current_customer
    end
    
    def edit
      @customer = current_customer
    end
  
    def update
      @customer = current_customer
      @customer.update
    end

end
