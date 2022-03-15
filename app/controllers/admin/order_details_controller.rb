class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if order_detail_params[:make_status] == OrderDetail.make_statuses.key(2)
      @order_detail.order.update(order_status: Order.order_statuses.key(2))
    # 製作ステータスが製作完了の個数と注文商品の個数が一致した時処理を行う
    elsif OrderDetail.where(make_status: OrderDetail.make_statuses.key(3), order_id: params[:order_id]).count == OrderDetail.where(order_id: params[:order_id]).count
      @order_detail.order.update(order_status: Order.order_statuses.key(3))
    end
    redirect_to admin_order_path(params[:order_id])
  end
   
  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
end
