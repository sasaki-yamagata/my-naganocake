class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confim
    @order = Order.new(order_params)
    @order.ship_fee = 800
    @item_total_price = 0
    select_address = params[:order][:select_address]
    if  select_address == 'my_address'
      @order.ship_to_postal_code = current_customer.postal_code
      @order.ship_to_address = current_customer.address
      @order.ship_to_name = current_customer.family_name + current_customer.first_name
    elsif select_address == 'registered_address'
      @address = Address.find(params[:order][:address_id])
      @order.ship_to_postal_code = @address.postal_code
      @order.ship_to_address = @address.address
      @order.ship_to_name = @address.ship_to_name
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.total_price = @order.total(@cart_items)
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @cart_items.each do |cart_item|
          @order_detail = OrderDetail.new
          @order_detail.order_id = @order.id
          @order_detail.item_id = cart_item.item_id
          @order_detail.buy_price = cart_item.item.tax_excluded_price
          @order_detail.amount = cart_item.amount
          if @order_detail.save
            CartItem.destroy_all
          end
        end
        redirect_to complete_orders_path
    else
      render :new
    end
  
    
    
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :ship_to_postal_code, :ship_to_address, :ship_to_name, :ship_fee, :total_price)
  end
end
