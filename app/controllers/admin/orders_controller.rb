class Admin::OrdersController < ApplicationController
  
  def show
    #@order = Order.find(params[:id])
    #@order_details = Orderdetail.where(order_id: @order.id)
    #@tax = 1.1
    @sum_price = 0
  end
  
  def update
  end
end
