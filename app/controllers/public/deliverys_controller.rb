class Public::DeliverysController < ApplicationController
  before_action :authenticate_customer!

  def index
     @destinations = Destination.all
     @delivery_name = @destinations.where(customer_id: current_customer.id)
     @destination = Destination.new
  end


  def create
      @destination = Destination.new(destination_params)
      @destination.customer_id = current_customer.id
    if @destination.save
      redirect_to deliverys_path
    else
      @destinations = Destination.all
      @delivery_name = @destinations.where(customer_id: current_customer.id)
      render :index
    end
  end



  def edit
    @destination = Destination.find(params[:id])
  end

  def update
       @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to deliverys_path
    else
      render :edit
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    redirect_to deliverys_path
  end

    private

  def destination_params
    params.require(:destination).permit(:zipcode, :address, :delivery_name)
  end

end
