class AwakeningsController < ApplicationController
  before_action :authenticate_user

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
  def set_awakening
    @awakening = Awakening.find(params[:id])
  end
end

