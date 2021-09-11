class FavoritesController < ApplicationController
  before_action :set_plan
  before_action :authenticate_user! 

  def create
   if @plan.user_id != current_user.id
    @favorite = Favorite.create(user_id:current_user.id,plan_id:@plan.id)
    redirect_to plan_path(params[:plan_id])
   end
  end

  def destroy
   @favorite = Favorite.find_by(user_id: current_user.id, plan_id: @plan.id)
    @favorite.destroy
    redirect_to plan_path(params[:plan_id])
  end
  
  private
  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

end
