class SupplementsController < ApplicationController

  def create
    @supplement = Supplement.new(supplement_params)
    if @supplement.save
      redirect_to root_path
    end
  end

  private
  def supplement_params
    params.require(:supplement).permit(:description,:genre_id,:location_id).merge(plan_id: params[:plan_id],user_id: current_user.id)
  end
end
