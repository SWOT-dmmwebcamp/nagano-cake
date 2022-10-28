class Admin::OrderdetailsController < ApplicationController
  
  def update
    @order_detail = Orderdetail.find(params[:id])
    @order_detail.update(detail_params)
    
    if params[:item_status] == "2" then
      order = Order.find(@order_detail.order_id)
      order.update(order_status: "making")
    end
    
    @test = 0
    @n = 0
    item_status = Orderdetail.where(order_id: @order_detail.order_id).pluck(:item_status)
    item_status.each do |s|
      unless s == 3 then
        @test = 1
      end
      @n += 1
    end
    
    if @test == 0
      order = Order.find(@order_detail.order_id)
      order.update(order_status: "send_prepare")
    end
    
    redirect_to request.referer
  end
  
  
  private
  
  def detail_params
    params.permit(:item_status)
  end
  
end
