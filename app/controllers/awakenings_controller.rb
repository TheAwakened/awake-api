class AwakeningsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @awakenings = @user.awakenings
  end

  def create
    @awakening = current_user.awakenings.build

    if @awakening.save
      redirect_to current_user, notice: 'Updated Awakening'
    else
      render :new
    end
  end

  private 
  def set_user
    @user = User.find(params[:user_id])
  end
end

