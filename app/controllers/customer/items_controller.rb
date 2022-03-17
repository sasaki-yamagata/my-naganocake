class Customer::ItemsController < ApplicationController
  def index
     @genres =  Genre.all
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id])
    else
      @items = Item.all
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
