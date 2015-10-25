class HeroesController < ApplicationController
  load_and_authorize_resource

  def index
    @q = @heroes.order(id: :desc).search(params[:q])
    if(params[:q])
      @heroes = @q.result(distinct: true).page(params[:page])
    else
      @heroes = @heroes.none.page(params[:page])
    end
  end

  def show

  end

  def create
    if @hero.save
      render json: @hero.to_json(Hero.compact_json), status: :ok
    else
      render json: @hero.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @hero.update(hero_params)
      render json: @hero.to_json(Hero.compact_json), status: :ok
    else
      render json: @hero.errors.full_messages, status: :unprocessable_entity
    end
  end

  def list_ajax
    @q = Hero.all.ransack(params[:q])
    if params[:q].present?
      @heroes = @q.result(distinct: true).page(params[:page])
    else
      @heroes = @heroes.none.page(params[:page])
    end
  end

  private
    def hero_params
      params.require(:hero).permit(:name, :hero_type, :hero_type, :position, :description, :base_star, :rcm_star, :get_start_dif, :grant_star_dif,
      :damage_point, :team_support_point, :str_point, :int_point, :agi_point, :max_hp, :physic_dmg, :magic_dmg, :magic_regist, :physic_shield, :physic_chaos,
      :img_url, :lock_version, :created_at, :updated_at)
    end
end
