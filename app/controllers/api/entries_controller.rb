class API::EntriesController < API::ApplicationController

  def index
    user_ids = Awakening.today.pluck("user_id")
    @users = User.where(id: user_ids)
    render json: @users, status: :ok
  end

end
