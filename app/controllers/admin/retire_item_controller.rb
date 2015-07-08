#inheret from Admin::AdminController and remove 'authorize?' method?

#consider moving this to the ItemsController#update
class Admin::RetireItemController < ApplicationController
  def update
    @item = Item.find(params[:format])
    @item.update(retire: true)
    redirect_to admin_items_path(@item)
  end
end
