class Admin::OrderdetailsController < ApplicationController
  
  def update
    @order_detail = Orderdetail.find(params[:id])
    @order_detail.update(detail_params)
    redirect_to admin_order_path(@order_detail.order_id)
  end
  
  
  private
  
  def detail_params
    params.permit(:item_status)
  end
  
end
