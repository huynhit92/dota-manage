class RelHeroGrownLevelsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @rel_hero_grown_level.save
      render json: @rel_hero_grown_level.to_json(:include => :grown_level_master), status: :ok
    else
      render json: @rel_hero_grown_level.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @rel_hero_grown_level.update(rel_hero_grown_level_params)
      render json: @rel_hero_grown_level.to_json(:include => :grown_level_master), status: :ok
    else
      render json: @rel_hero_grown_level.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def rel_hero_grown_level_params
      params.require(:rel_hero_grown_level).permit(:hero_id, :lock_version, :str, :int, :agi, :grown_level_master_id, :lock_version, :created_at, :updated_at)
    end
end
