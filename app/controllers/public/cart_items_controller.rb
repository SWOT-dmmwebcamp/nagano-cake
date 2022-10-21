class Public::CartItemsController < ApplicationController
  
  def index
    @cnt = [*1..9]
  end
  
end
