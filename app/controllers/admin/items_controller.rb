class Admin::ItemsController < ApplicationController

  def new
      @item = Item.new
  end

  def create
      @item.save
      redirect_to admin_items_path
  end

  def index
      @items = Item.page(params[:page])
  end
  
  def show
      @item = Book.find(params[:id])
  end

  private
  
  def item_params
      params.require(:item).permit(:name, :introduction, :price, :is_active)
  end


end
