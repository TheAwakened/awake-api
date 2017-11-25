class API::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def authenticate_user
    unauthorized and return if request.headers['Authorization'].nil?
    token =  request.headers['Authorization'].split.last
    payload = Auth.decode(token)

    unauthorized and return unless payload
    user_id = payload[0]["user_id"]
    @current_user = User.find(user_id)
  end

  def current_user
    @current_user
  end

  def not_found
    render json: { error: "Not Found" }, status: 404
  end

  def unauthorized
    render json: { error: "Unauthorized" }, status: 401
  end
end
