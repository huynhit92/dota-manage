class RelHeroDividesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def create
    if @rel_hero_divide.save
      render json: @rel_hero_divide.to_json(:include => :divide), status: :ok
    else
      render json: @rel_hero_divide.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @rel_hero_divide.update(rel_hero_divide_params)
      render json: @rel_hero_divide.to_json(:include => :divide), status: :ok
    else
      render json: @rel_hero_divide.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @rel_hero_divide.destroy
      render json: {response: 'ok'}.to_json, status: :ok
    else
      render json: @rel_hero_divide.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def rel_hero_divide_params
      params.require(:rel_hero_divide).permit(:hero_id, :divide_id, :lock_version)
    end

end
