class Public::OrdersController < ApplicationController

  def confirm
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

end
