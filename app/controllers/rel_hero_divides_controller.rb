class RelHeroDividesController < ApplicationController
  def index
    @rel_hero_divides = RelHeroDivide.all
  end
  
  def new
    @rel_hero_divide = RelHeroDivide.new
  end
  
  def show
    
  end
  
  def create
    @rel_hero_divide = RelHeroDivide.new(rel_hero_divide_params)
    if @rel_hero_divide.save
      redirect_to rel_hero_divides_path
    else
      render action: "new"
      
    end
  end
  
  def edit
    @rel_hero_divide = RelHeroDivide.find(params[:id])
  end
  
  def update
    @rel_hero_divide = RelHeroDivide.find(params[:id])
    if @rel_hero_divide.update(rel_hero_divide_params)
      redirect_to edit_rel_hero_divide_path(@rel_hero_divide), notice: "Update complete"
    else
      render action: "edit"
      
    end
  end
  
  def destroy
    @rel_hero_divide = RelHeroDivide.find(params[:id])
    @rel_hero_divide.destroy
    flash[:success] = "Success"
    redirect_to rel_hero_divides_path
  end
  
  private
  
    def rel_hero_divide_params
      params.require(:rel_hero_divide).permit(:hero_id, :divide_id, :lock_version)
    end
  
end