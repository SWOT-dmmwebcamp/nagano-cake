class Public::HomesController < ApplicationController
  def top
    @recent_items = Item.order(created_at: :desc).page(params[:page]).per(4)
  end

  def about
  end
end
