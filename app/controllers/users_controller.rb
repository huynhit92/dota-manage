class UsersController < ApplicationController
  load_and_authorized_resource

  def index
    @q = User.order(id: :desc).search(params[:q])
    if params[:q].present?
      @users = @q.result(distinct: true).page(params[:page])
    else
      @users = @accounts.none.page(params[:page])
    end
  end
  
  def show
    #automatic generate by cancan
  end
  
  def create
    @user = User.new(account_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(account_params)
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:user_name, :password, :email, :company_name, :name, :account_type_master_id, :lock_version,:updated_at, :updated_by, :created_by, :created_at)
  end
end