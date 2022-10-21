class Admin::CustomersController < ApplicationController
  def index
  @customers = Customer.all
  end

  def show
  @customer = Customer.find(params[:id])
  end

  def edit
  @customer = Customer.find(params[:id])
  end

  def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    flash[:notice] = "You have updated user successfully."
      redirect_to admin_customer_path(@customer.id)
  else
      render :edit
  end
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :kana_last_name, :kana_first_name, :zipcode, :address,
    :phone_number,:email,:password,:delete_flag)
  end

end

