class API::AwakeningsController < API::ApplicationController
  before_action :authenticate_user

  def create
    raise_no_more_than_once and return if current_user.awake_today?

    @awakening = current_user.awakenings.build
    if @awakening.save
      render json: { message: "You have successfully awaken."}, status: :created
    else
      render json: { errors: @awakening.errors.full_messages }, status: 422
    end
  end

  private
  def raise_no_more_than_once
    # Return an array of error messages to ensure
    # consistency.
    render json: { errors: ['You cannot awake more than once per day'] }, status: 422
  end

end

