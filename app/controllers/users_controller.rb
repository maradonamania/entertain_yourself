class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]
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

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  def move_to_index
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end
end
