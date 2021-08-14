class UsersController < ApplicationController
  before_action :set_params,only: [:show,:edit,:update]
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
    params.require(:user).permit(:nickname,:email,:password)
  end
end
