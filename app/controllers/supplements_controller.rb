class SupplementsController < ApplicationController
  def create
    @user = User.find_by(id: current_user.id)
    @supplement = Supplement.new(supplement_params)
    if @supplement.save
      ActionCable.server.broadcast 'supplement_channel',
                                   content: @supplement.to_json(include: { user: {} }, methods: [:location, :genre])
    end
  end

  private

  def supplement_params
    params.require(:supplement).permit(:description, :genre_id, :location_id).merge(plan_id: params[:plan_id],
                                                                                    user_id: current_user.id)
  end
end
