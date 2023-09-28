class Public::CustomersController < ApplicationController
    
    before_action :authenticate_customer!
    
    def show
      @customer = current_customer
    end
    
    def edit
      @customer = current_customer
    end
  
    def update
        @customer = current_customer
        if @customer.update(customer_params)
        flash[:update] = "You have updated user info successfully."
        redirect_to public_customers_mypage_path
        else
        render 'edit'
        end
    end
    
    def confirm_withdraw
       @customer = Customer.find(params[:id])
    end
    
    def withdraw
       @customer = Customer.find(params[:id])
       @customer.update(is_valid: false)
       reset_session
       flash[:notice] = "退会処理を実行いたしました"
       redirect_to root_path
    end
    
    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name,
                                        :last_name_kana, :first_name_kana,
                                        :email, :postal_code, :address, :telephone_number)
    end


end
