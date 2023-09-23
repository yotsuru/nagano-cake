class Public::ItemsController < ApplicationController
    
    def index
        @items = Item.all
    end
    
    def show
        @items = Item.all
        @item = Item.find(params[:id])
    end
end
