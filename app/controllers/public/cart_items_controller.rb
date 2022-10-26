class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id) #ログイン機能出来たら"customer_id: current_customer.id"に変える
    @cnt = [*1..10]
    @sum_price = 0
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    #if cart_item.customer_id == current_customer.id
      cart_item.destroy
    #end
    redirect_to request.referer
  end
  
  def destroy_all
    cart_items = CartItem.where(customer_id: current_customer.id) #ログイン機能出来たら"customer_id: current_customer.id"に変える
    #if cart_item.customer_id == current_customer.id
      cart_items.destroy_all
    #end
    redirect_to request.referer
  end
  
  private
  
  def cart_item_params
    params.permit(:piece)
  end
  
end
