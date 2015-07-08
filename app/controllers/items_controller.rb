class ItemsController < ApplicationController

  #def new #compare to admin
  #@item = Item.new
  #end

  def index
    @categories = Category.all
    @items = (Item.not_retired_too + Item.not_retired)
  end

  def show
    @item = Item.find(params[:id])
  end

  #def create #compare to admin
  #@item = Item.new(item_params)
  #if @item.save
  #@item.categories_list(params['item']['categories'])
  #flash.notice = 'Item was successfully created.'
  #redirect_to admin_item_path(@item)
  #else
  #render :new
  #end
  #end

  #def edit #compare to admin
  #end

  #def update #compare to admin
  #if @item.update(item_params)
  #@item.categories_list(params['item']['categories'])
  #flash.notice = 'Item was successfully updated.'
  #redirect_to admin_item_path(@item)
  #else
  #render :edit
  #end
  #end

  #def destroy #compare to admin
  #if @item.destroy
  #redirect_to admin_items_path, notice: 'Item was successfully deleted.'
  #end
  #end

  #maybe remove private methods
  #private
  #def set_item
  #end

  #def item_params
  #params.require(:item).permit(:title,
  #:description,
  #:price_pie,
  #:categories_list,
  #:picture
  #)
  #end
end
