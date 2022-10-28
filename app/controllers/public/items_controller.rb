class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    if params[:item_name].present?
      @item_search = Item.where('item_name LIKE?', "%#{params[:item_name]}%")
    else
      @item_search =Item.none
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :caption, :genre_id, :price, :sales_status, :image)
  end
end
