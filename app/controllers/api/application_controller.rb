class API::ApplicationController < ApplicationController

  def authenticate_developer
    unauthorized and return unless request.params['api_key']
    api_key = request.params['api_key']

    developer = User.find_by(api_key: api_key)

    unauthorized and return unless developer
  end

  def authenticate_user
    unauthorized and return if request.authorization.nil?
    token =  request.authorization.split.last

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
