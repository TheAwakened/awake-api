class AwakeningsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user, only: :create
  before_action :set_user, only: :index

  def index
    @awakenings = @user.awakenings
  end

  def create
    @awakening = current_user.awakenings.build

    respond_to do |format|
      if @awakening.save
        format.html { redirect_to current_user, notice: 'Updated Awakening' }
        format.json { render :show, status: :created, location: @awakening }
      else
        format.html { render :new }
        format.json { render json: @awakening.errors, status: :unprocessable_entity }
      end

    end
  end

  private 
  def set_user
    @user = User.find(params[:user_id])
  end
end

