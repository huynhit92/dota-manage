class DividesController < ApplicationController
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
    @q = Divide.all.ransack(params[:q])
    if params[:q].present?
      @divides = @q.result(distinct: true).page(params[:page])
    else
      @divides = @divides.none.page(params[:page])
    end
  end

  private

end
