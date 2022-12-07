class Public::ItemsController < ApplicationController

  def index
      @items = Item.all.order(created_at: :desc)
      @items = Item.where(id: "id")
      @items = Item.page(params[:page])
  end

  def show
      @item = Item.find(params[:id])
  end
end
