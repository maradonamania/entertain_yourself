class PlansController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy,:update]

  def index
    @user = current_user
    @plans = Plan.all.order('created_at DESC')
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

  private 

  def plan_params
    params.require(:plan).permit(:image,:name,:description,:genre_id,:expected_time_id,:location_id,:budget_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @plan.user_id 
      redirect_to root_path 
    end
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end
end
