class ItemsController < ApplicationController
  load_and_authorize_resource

  def index
    @items = @items.limit(10)
  end
  
  def new
    
  end
  
  def show
    
  end
  
  def create
    
  end

  def update
    Rails.logger.debug(item_params)
    if @item.update(item_params)
      render json: @item, status: :ok
    else
      render json: @item.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :required_level, :description, :made_of, :can_create, :hero_use, :receive_method, :quality, :item_type, :img_url, :lock_version, :created_at, :updated_at)
  end
end