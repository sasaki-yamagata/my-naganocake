class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:keyword]
      @items = Item.search(params[:keyword])
      @keyword = params[:keyword]
    else
      @items = Item.all
    end
    
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      flash[:notice] = '商品を登録しました'
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
end

private

def item_params
  params.require(:item).permit(:image, :name, :introduction, :genre_id, :tax_excluded_price, :is_sale)
end