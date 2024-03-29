class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = User.order(id: :desc).search(params[:q])
    if params[:q].present?
      @users = @q.result(distinct: true).page(params[:page])
    else
      @users = @users.none.page(params[:page])
    end
  end

  def show
    #automatic generate by cancan
  end

  def create
    @user = User.new(user_params)
    if @user.save
    else
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_url, notice: "#{GLOBAL_SAVE_MSG}"
    else
      render action: 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password)
  end
end
