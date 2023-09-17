class Admin::ItemsController < ApplicationController
    
    def new
      @item = Item.new
    end
    
    def create
      @item = Item.new(item_params)
      @item.save
      
    end
    
    private
 
    def product_params
      params.require(:item).permit(:image,:name,:introduction,:price,)
    end
end
