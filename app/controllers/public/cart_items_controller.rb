class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  #カートに商品を追加する
  def create
    @count = CartItem.where(customer_id: current_customer.id).where(item_id: params[:id])
    if @count.count == 0 then #カート内に同じ商品がない場合
      @cart_item = CartItem.new
      @cart_item.customer_id = current_customer.id
      @cart_item.item_id = params[:id]
      @cart_item.piece = params[:piece]
      @cart_item.save
    else #カート内に同じ商品があった場合
      cart_item = CartItem.find_by(item_id: params[:id])
      cart_item.piece += params[:piece].to_i
      cart_item.save
    end
    redirect_to cart_items_path
  end

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
    params.permit(:item_id, :piece)
  end

end
