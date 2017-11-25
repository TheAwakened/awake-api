class API::UserTokenController < API::ApplicationController

  def create
    user = User.find_by(username: params[:auth][:username])
    if user&.authenticate(params[:auth][:password])
      payload = { user_id: user.id }
      token = Auth.encode(payload)
      render json: { jwt: token }, status: 200
    else
      not_found
    end
  end

end
