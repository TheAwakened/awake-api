class API::EntriesController < API::ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

end
