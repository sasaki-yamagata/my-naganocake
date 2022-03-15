class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @item_total_price = 0
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
    
  end
  
  def create
    if CartItem.find_by(item_id: cart_item_params[:item_id], customer_id: current_customer.id)
      @cart_item = CartItem.find_by(item_id: cart_item_params[:item_id])
      new_amount = @cart_item.amount + cart_item_params[:amount].to_i
      @cart_item.update(amount: new_amount)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        redirect_to cart_items_path
      else
        @item = Item.find(cart_item_params[:item_id])
        render 'customer/items/show'
      end
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params 
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
