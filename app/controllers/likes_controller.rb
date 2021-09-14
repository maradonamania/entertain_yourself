class LikesController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    Like.create(user_id: current_user.id, plan_id: params[:plan_id])
    # redirect_to plan_path(params[:plan_id])
  end

  def destroy
    @plan = Plan.find(params[:plan_id])
    Like.find_by(user_id: current_user.id, plan_id: params[:plan_id]).destroy
    # redirect_to plan_path(params[:plan_id])
  end
end
