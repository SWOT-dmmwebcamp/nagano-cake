class Public::SearchesController < ApplicationController
  
  def search
    if params [:item_name].
    @items = Item.looks(params[:word])
  end  
end
