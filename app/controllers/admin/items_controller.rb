class Admin::ItemsController < ApplicationController

  def new
      @item = Item.new
  end

  def create
      @item.save
      redirect_to admin_items_path
  end

  def index
      @items = Item.all
  end
end
