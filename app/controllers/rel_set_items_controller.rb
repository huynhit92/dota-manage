class RelSetItemsController < ApplicationController
  load_and_authorize_resource

  def create
    if @rel_set_item.save
      render json: @rel_set_item.to_json(:include => {:item => { :methods => :methods_json }}), status: :ok
    else
      render json: @rel_set_item.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @rel_set_item.update(rel_set_item_params)
      render json: @rel_set_item.to_json(:include => {:item => { :methods => :methods_json }}), status: :ok
    else
      render json: @rel_set_item.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def rel_set_item_params
      params.require(:rel_set_item).permit(:item_set_id, :item_id, :lock_version, :created_at, :updated_at)
    end
end
