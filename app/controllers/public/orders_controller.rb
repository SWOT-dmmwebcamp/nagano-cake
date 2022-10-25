class Public::OrdersController < ApplicationController

  def confirm
    @order = Order.new
    @orderdetails = Orderdetail.new
    
    @cart_items = CartItem.where(customer_id: 1) #ログイン機能出来たらcurremt_customer.id
    @sum_price = 0
    @delivery_fee = 800
    @pay_type = Order.pay_types_i18n[params[:pay_type]]
    @cust = Customer.find(1) #ログイン機能出来たらcurremt_customer.id
    
    @zip = 
      case params[:status]
        when "tag1"
          "〒" + @cust.zipcode
        when "tag2"
          ""
        when "tag3"
          params[:zip]
      end
    
    @address = 
      case params[:status]
        when "tag1"
          @cust.address
        when "tag2"
          params[:dest]
        when "tag3"
          params[:add]
      end
    
    @name = 
      case params[:status]
        when "tag1"
          @cust.last_name + " " + @cust.first_name
        when "tag2"
          ""
        when "tag3"
          params[:name]
      end
  end
  
  def create
    order = (1..1).map { { 
      customer_id: "1", 
      delivery_zip: "1234567",
      delivery_address: "test_address",
      delivery_name: "test_name",
      delivery_fee: 800,
      total_price: 1000,
      pay_type: 0,
      order_status: 0,
      created_at: Time.current,
      updated_at: Time.current
    } }
    Order.insert_all order
    
    orderdetails = (1..3).map { { 
      order_id: 1,
  	  item_id: 1,
  	  price_at_purchase: 1,
  	  piece: 1,
  	  item_status: 0,
  	  created_at: Time.current,
      updated_at: Time.current
    } }
    Orderdetail.insert_all orderdetails
    
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
    @cust = Customer.find(1) #ログイン機能出来たらfind(current_customer.id)にする
    @cust_name = @cust.last_name + " " + @cust.first_name
    @zip = @cust.zipcode[0,3] + "-" + @cust.zipcode[3,4]
    @dest = Destination.where(customer_id: 1).pluck(:zipcode, :addresss, :delivery_name)
    @destinations = []
    @dest.each do |d|
      @destinations.push("〒" + d[0] + "　" + d[1] + "　" + d[2])
    end
  end
  
  #private

  #def order_params
    #params.permit(:customer_id, :delivery_zip, :delivery_address, :delivery_name, :delivery_fee, :total_price, :pay_type, :order_status)
  #end
  
end
