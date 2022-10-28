class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.order("created_at DESC").page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
    @cust = Customer.find(@order.customer_id)
    @cust_name = @cust.last_name + " " + @cust.first_name
    @cust_orders = Order.where(customer_id: @cust).order("created_at DESC").page(params[:page]).per(10)
  end
  
end
