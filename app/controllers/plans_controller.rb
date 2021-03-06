class PlansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy, :update]
  before_action :set_q, only: [:index, :search, :show]

  def index
    user = current_user
    @plans = Plan.all.order('created_at DESC')
    @rankings = Plan.find(Like.group(:plan_id).order('count(plan_id) DESC').limit(3).pluck(:plan_id))
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(@plan.user_id)
    @supplement = Supplement.new
    @supplements = @plan.supplements.includes(:user)
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to root_path
  end

  # def search
  #   @plans = Plan.search(params[:keyword])
  # end
  def search
    @results = @q.result
  end

  def about
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :genre_id, :expected_time_id, :location_id,
                                 :budget_id, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @plan.user_id
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_q
    @q = Plan.ransack(params[:q])
  end
end
