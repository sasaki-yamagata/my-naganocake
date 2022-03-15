class Admin::OrdersController < ApplicationController
  def index
    if params[:customer_id]
      @orders = Order.where(customer_id: params[:customer_id])
    else
      @orders = Order.all
    end
    
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @item_total_price = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if order_params[:order_status] == Order.order_statuses.key(1)
      @order.order_details.update_all(make_status: OrderDetail.make_statuses.key(1))
    end
    redirect_to admin_order_path(@order)
  end
  
  

  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
