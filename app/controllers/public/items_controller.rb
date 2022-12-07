class Public::ItemsController < ApplicationController

  def index
      @item = Item.all.order(created_at: :desc)
  end
end
