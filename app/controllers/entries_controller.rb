class EntriesController < ApplicationController

  def index
    user_ids = Awakening.today.pluck("user_id")
    @users = User.where(id: user_ids)
  end

end
