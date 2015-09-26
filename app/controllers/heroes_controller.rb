class HeroesController < ApplicationController
  load_and_authorize_resource

  def index
    @heroes_strength = @heroes.list_strength
    @heroes_agility = @heroes.list_agility
    @heroes_inteligent = @heroes.list_inteligent
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
    @q = Hero.all.ransack(params[:q])
    if params[:q].present?
      @heroes = @q.result(distinct: true).page(params[:page])
    else
      @heroes = @heroes.none.page(params[:page])
    end
  end

  def test
    @hero = Hero.find(params[:id])
    render partial: 'test', layout: false
  end

  private
  
end