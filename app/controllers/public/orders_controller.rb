class Public::OrdersController < ApplicationController

  def confirm
    @order = Order.new
    @orderdetails = Orderdetail.new
    @cart_items = CartItem.where(customer_id: current_customer.id) 
    @sum_price = 0
    @delivery_fee = 800
    @pay_type = Order.pay_types_i18n[params[:pay_type]]
    @cust = Customer.find(current_customer.id) 
    
    @zip = 
      case params[:status]
        when "tag1"
          @cust.zipcode
        when "tag2"
          params[:dest].slice(1,params[:dest].index(" ")-1)
        when "tag3"
          params[:zip]
      end
    
    @address = 
      case params[:status]
        when "tag1"
          @cust.address
        when "tag2"
          params[:dest].slice(params[:dest].index(" ")+1,(params[:dest].rindex(" ")+1) - (params[:dest].index(" ")+1))
        when "tag3"
          params[:add]
      end
    
    @name = 
      case params[:status]
        when "tag1"
          @cust.last_name + " " + @cust.first_name
        when "tag2"
          params[:dest].slice(params[:dest].rindex(" ")+1,20)
        when "tag3"
          params[:name]
      end
  end
  
  def create
    order = (1..1).map { { 
      customer_id: current_customer.id, 
      delivery_zip: params[:order][:delivery_zip],
      delivery_address: params[:order][:delivery_address],
      delivery_name: params[:order][:delivery_name],
      delivery_fee: params[:order][:delivery_fee],
      total_price: params[:order][:total_price],
      pay_type: params[:order][:pay_type],
      order_status: params[:order][:order_status],
      created_at: Time.current,
      updated_at: Time.current
    } }
    Order.insert_all order
    
    order_data = Order.where(customer_id: current_customer.id).order(created_at: :desc).limit(1).pluck(:id)
    count_cart_items = CartItem.where(customer_id: current_customer.id).count
    
    unless count_cart_items == 0 then
      cartitems = CartItem.where(customer_id: current_customer.id)
      cartitems.each do |i|
        orderdetails = (1..1).map { { 
          order_id: order_data[0],
      	  item_id: i.item_id,
      	  price_at_purchase: Item.where(id: i.item_id).pluck(:price)[0] * 1.1,
      	  piece: i.piece,
      	  item_status: 0,
      	  created_at: Time.current,
          updated_at: Time.current
        } }
        Orderdetail.insert_all orderdetails
      end
      
      items = CartItem.where(customer_id: current_customer.id) 
      items.destroy_all
    end
    
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cust = Customer.find(current_customer.id) #ログイン機能出来たらfind(current_customer.id)にする
    @cust_name = @cust.last_name + " " + @cust.first_name
    @zip = @cust.zipcode[0,3] + "-" + @cust.zipcode[3,4]
    @dest = Destination.where(customer_id: current_customer.id).pluck(:zipcode, :addresss, :delivery_name)
    @destinations = []
    @dest.each do |d|
      @destinations.push("〒" + d[0] + " " + d[1] + " " + d[2])
    end
  end
  
  #private

  #def order_params
    #params.permit(:customer_id, :delivery_zip, :delivery_address, :delivery_name, :delivery_fee, :total_price, :pay_type, :order_status)
  #end
  
end
