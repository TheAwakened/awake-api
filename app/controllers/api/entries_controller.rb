class API::EntriesController < API::ApplicationController

  def index
    awake_users = User.joins(:awakenings)
      .select('id', 'username', 'awakenings.created_at')
      .where('awakenings.created_at >= ?', Awakening.today_time)
      .order('awakenings.created_at')
    users = User.select('id, username')

    results = awake_users | users
    render json: results, status: :ok
  end

end
