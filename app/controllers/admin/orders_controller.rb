class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = Orderdetail.where(order_id: @order.id)
    @cust = @order.customer.last_name + " " + @order.customer.first_name
    @zip = @order.delivery_zip[0,3] + "-" + @order.delivery_zip[3,4]
    @order_status = ["入金待ち", "pay_wait"], ["入金確認", "pay_confirm"], ["製作中", "making"], ["発送準備中", "send_prepare"], ["発送済み", "sent"]
    @num = Order.order_statuses[@order.order_status]
    @key = Order.order_statuses.key(@num)
    @tax = 1.1
    @item_status = ["着手不可", "0"], ["製作待ち", "1"], ["製作中", "2"], ["製作完了", "3"]
    @sum_price = 0
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)

    if params[:order][:order_status] == "pay_confirm" then
      details = Orderdetail.where(order_id: params[:id])
      details.update_all(item_status: "1")
    end

    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
