class API::AwakeningsController < API::ApplicationController
  before_action :authenticate_user

  def create
    @awakening = current_user.awakenings.build
    if @awakening.save
      render json: @awakening, status: :created
    else 
      render json: { errors: @awakening.errors.full_messages }, status: 422
    end
  end
end

