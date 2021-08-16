class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, plan_id: params[:plan_id])
    redirect_to plan_path(params[:plan_id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, plan_id: params[:plan_id]).destroy
    redirect_to plan_path(params[:plan_id])
  end
end
