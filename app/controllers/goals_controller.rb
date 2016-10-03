class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :owned_goal, only: [:edit, :update, :destroy]

  def index
    @goals = Goal.all.order('created_at DESC')
  end

  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:success] = 'Your goals were saved'
      redirect_to goal_path(@goal)
    else
      flash[:alert] = 'Your goals were not saved. Please try again.'
      render :new
    end
  end

  def show
  end


  private

  def goal_params
    params.require(:goal).permit(:year, :month, :goal1, :goal2, :goal3)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def owned_goal
    unless current_user == @goal.user
      flash[:alert] = "That goal doesn't belong to you!"
      redirect_to root_path
    end
  end
end
