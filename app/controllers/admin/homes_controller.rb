class Admin::HomesController < ApplicationController
  
  def top
    #@orders = Order.page(params[:page]).per(10)
  end
  
  def show
    #@orders = Order.all
    #@order = @orders.find(params[:id])
    #@cust = @order.customer_id
    #@cust_orders = Order.where(customer_id: @cust).page(params[:page]).per(10)
  end
  
end
