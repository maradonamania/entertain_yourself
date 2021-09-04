class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update,:followings,:followers]
  before_action :move_to_index, only: [:edit,:update]
  before_action :set_q, only: [:followings,:followers,:show]
  def show
    @plans = @user.plans
  end

  def edit
  end

  def update
    if @user.update(user_params)
      sign_in(@user, bypass: true)
      redirect_to root_path
    else
      render :edit
    end
  end

  def followings
    @followings = @user.followings.order('created_at DESC')
  end

  def followers
    @followers = @user.followers.order('created_at DESC')
  end

  private

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @user.id
  end

  def set_q
    @q = Plan.ransack(params[:q])
  end
  
end
