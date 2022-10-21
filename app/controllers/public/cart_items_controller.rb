class Public::CartItemsController < ApplicationController
  
  def index
    @cnt = [*1..10]
  end
  
end
