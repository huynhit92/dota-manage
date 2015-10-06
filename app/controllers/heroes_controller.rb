class HeroesController < ApplicationController
  load_and_authorize_resource

  def index
    
  end

  def new

  end

  def show

  end

  def create

  end

  def edit

  end

  def update

  end

  def list_ajax
    Rails.logger.debug("COME IN HERE")
    @q = Hero.all.ransack(params[:q])
    if params[:q].present?
      @heroes = @q.result(distinct: true).page(params[:page])
    else
      @heroes = @heroes.none.page(params[:page])
    end
  end

  private

end
