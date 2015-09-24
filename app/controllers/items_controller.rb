class ItemsController < ApplicationController
  load_and_authorize_resource

  def index
    @items = @items.limit(10)
    Rails.logger.debug("dsadsa")
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
  
  private
  
end