class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = 'ユーザーをフォローしました'
    else
      flash[:alert] = 'ユーザーのフォローに失敗しました'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = 'ユーザーのフォローを解除しました'
    else
      flash[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
