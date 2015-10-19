class ItemsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Item.order(id: :desc).search(params[:q])
    Rails.logger.debug(@q)
    if(params[:q])
      Rails.logger.debug("")
      @items = @q.result(distinct: true).page(params[:page])
    else
      @items = @items.none.page(params[:page])
    end
    @files = Dir["#{Rails.root}/app/assets/images/items"]
    respond_to do |format|
      format.html
      format.json { render :json => @items, :methods => [:img_path, :get_color] }
    end
  end

  def new

  end

  def show

  end

  def create
    # @item = Item.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
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
